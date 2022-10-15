import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/entities/products_database_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/clear_cache.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/clear_user_database.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/delete_product_from_database.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/get_all_products_from_database.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/insert_product_into_database.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/update_amount_database.dart';

import '../../../../core/utl/utls.dart';
import '../../../blogs/domain/entities/blogs_entitie.dart';
import '../../domain/entities/all_products_entitie.dart';
import '../../domain/usecases/get_all_products_usecase.dart';

part 'all_products_event.dart';
part 'all_products_state.dart';

class AllProductsBloc extends Bloc<BaseAllProductsEvent, AllProductsState> {
  AllProductsBloc(
      this.allProductsUseCase,
      this.peroductsFromDatabaseUsecase,
      this.productDeletionFromDatabaseByIdUsecase,
      this.productsInsertionIntoDatabaseUsecase,
      this.cacheClearUsecase,
      this.userCartDataBaseClearUsecase,
      this.amountUpdateInDataBaseUsecase)
      : super(const AllProductsState()) {
    on<AllProductsEvent>(_getAllProducts);
    on<ProductDeletionFromDatabaseByIdEvent>(_deleteProductById);
    on<DatabaseInsertionEvent>(_insertProductIntoDatabase);

    on<AllProductsFromDatabaseEvent>(_getAllProductsFromDatabase);

    on<CurrentActiveTabIndexEvent>(_changeCurrentActiveTabIndex);
    on<AmountMapEvent>(_generateAmountsMap);
    on<AmountValueEvent>(_changeProductAmountValueWithId);
    on<LogoutEvent>(_logot);
    on<AmountOfProductsInCartEvent>(_changeAmountOfProductsInCart);
  }
  AllProductsUseCase allProductsUseCase;
  PeroductsFromDatabaseUsecase peroductsFromDatabaseUsecase;
  ProductsInsertionIntoDatabaseUsecase productsInsertionIntoDatabaseUsecase;
  ProductDeletionFromDatabaseByIdUsecase productDeletionFromDatabaseByIdUsecase;
  UserCartDataBaseClearUsecase userCartDataBaseClearUsecase;
  CacheClearUsecase cacheClearUsecase;
  AmountUpdateInDataBaseUsecase amountUpdateInDataBaseUsecase;
  FutureOr<void> _getAllProducts(
      AllProductsEvent event, Emitter<AllProductsState> emit) async {
    final result =
        await allProductsUseCase(AllproudctsParams(event.accessToken));

    result.fold(
      (l) => emit(state.copyWith(
          allProductsErrorMessage: l.message,
          requestState: AllProductsRequestState.error)),
      (r) => emit(
        state.copyWith(
          allProductsEntitie: r,
          requestState: AllProductsRequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _deleteProductById(ProductDeletionFromDatabaseByIdEvent event,
      Emitter<AllProductsState> emit) async {
    final result = await productDeletionFromDatabaseByIdUsecase(
      ProductDeletionFromDatabaseParams(
        databaseIds: event.databaseId,
        tableName: event.tableName,
      ),
    );
    result.fold(
      (l) => emit(state.copyWith(
          cartRequestState: CartRequestState.error,
          allProductsErrorMessage: l.message,
          statusCode: l.statusCode)),
      (r) => emit(
        state.copyWith(
          cartRequestState: CartRequestState.deletedSuccessfully,
          deleteProductNumber: r,
        ),
      ),
    );
  }

  FutureOr<void> _insertProductIntoDatabase(
      DatabaseInsertionEvent event, Emitter<AllProductsState> emit) async {
    for (var element in state.productsDatabaseEntitie) {
      if (element.productId == event.productId) {
        emit(state.copyWith(productExist: true));
        return;
      }
    }
    final result = await productsInsertionIntoDatabaseUsecase(
      DatabaseProductParams(
        description: event.description,
        imageUrl: event.imageUrl,
        name: event.name,
        price: event.price,
        productId: event.productId,
        amount: event.amount,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(
          cartRequestState: CartRequestState.error,
          allProductsErrorMessage: l.message,
          productExist: false)),
      (r) => emit(
        state.copyWith(
          cartRequestState: CartRequestState.insertedSuccessfully,
          productExist: false,
        ),
      ),
    );
  }

  FutureOr<void> _getAllProductsFromDatabase(AllProductsFromDatabaseEvent event,
      Emitter<AllProductsState> emit) async {
    final result = await peroductsFromDatabaseUsecase(
      ProductsFromDatabaseParams(
        tableName: event.tableName,
      ),
    );
    result.fold(
        (l) => emit(state.copyWith(
            cartRequestState: CartRequestState.error,
            allProductsErrorMessage: l.message,
            productExist: false)), (r) {
      int totalAmount = caculateProductsTotalPrice(r);
      return emit(
        state.copyWith(
            totalCartPrice: totalAmount,
            cartRequestState: CartRequestState.loaded,
            productsDatabaseEntitie: r,
            productExist: false),
      );
    });
  }

  int caculateProductsTotalPrice(List<ProductsDatabaseEntitie>? products) {
    if (products == []) {
      return 0;
    }
    int totalAmount = 0;
    products?.forEach((element) {
      totalAmount = totalAmount + (element.amount * element.price);
    });
    return totalAmount;
  }

  FutureOr<void> _changeCurrentActiveTabIndex(
      CurrentActiveTabIndexEvent event, Emitter<AllProductsState> emit) {
    List currentEntitiesList = [];

    switch (event.currentActiveTabIndex) {
      case 0:
        for (var element in state.allProductsEntitie) {
          if (element.plantEntitie != null) {
            currentEntitiesList
                .add({'price': element.price, 'entitie': element.plantEntitie});
          } else if (element.seedEntitie != null) {
            currentEntitiesList
                .add({'price': element.price, 'entitie': element.seedEntitie});
          } else {
            currentEntitiesList
                .add({'price': element.price, 'entitie': element.toolEntitie});
          }
        }
        emit(
          state.copyWith(
            activeEntitie: currentEntitiesList,
            currentActiveTabIndex: 0,
          ),
        );
        break;
      case 1:
        for (var element in state.allProductsEntitie) {
          if (element.plantEntitie != null) {
            currentEntitiesList
                .add({'price': element.price, 'entitie': element.plantEntitie});
          }
        }
        emit(
          state.copyWith(
            activeEntitie: currentEntitiesList,
            currentActiveTabIndex: 1,
          ),
        );

        break;
      case 2:
        for (var element in state.allProductsEntitie) {
          if (element.seedEntitie != null) {
            currentEntitiesList
                .add({'price': element.price, 'entitie': element.seedEntitie});
          }
        }
        emit(
          state.copyWith(
            activeEntitie: currentEntitiesList,
            currentActiveTabIndex: 2,
          ),
        );

        break;
      case 3:
        for (var element in state.allProductsEntitie) {
          if (element.toolEntitie != null) {
            currentEntitiesList
                .add({'price': element.price, 'entitie': element.toolEntitie});
          }
        }
        emit(
          state.copyWith(
            activeEntitie: currentEntitiesList,
            currentActiveTabIndex: 3,
          ),
        );
        break;
    }
  }

  FutureOr<void> _generateAmountsMap(
      AmountMapEvent event, Emitter<AllProductsState> emit) {
    Map<String, int> generatedMap = {};
    for (var element in event.allProducts) {
      if (element.plantEntitie != null) {
        generatedMap.addAll({element.plantEntitie!.id: 1});
      } else if (element.seedEntitie != null) {
        generatedMap.addAll({element.seedEntitie!.id: 1});
      } else if (element.toolEntitie != null) {
        generatedMap.addAll({element.toolEntitie!.id: 1});
      }
    }
    emit(
      state.copyWith(
        amountOfAllProducts: generatedMap,
      ),
    );
  }

  FutureOr<void> _changeProductAmountValueWithId(
      AmountValueEvent event, Emitter<AllProductsState> emit) {
    Map<String, int> updatedMap = Map.from(state.amountOfAllProducts);
    if (event.isIncrement) {
      updatedMap[event.id] = updatedMap[event.id]! + 1;
      emit(state.copyWith(
        amountOfAllProducts: updatedMap,
      ));
    } else {
      if (updatedMap[event.id] == 1) {
        emit(state.copyWith(
          amountOfAllProducts: updatedMap,
        ));
      } else {
        updatedMap[event.id] = updatedMap[event.id]! - 1;
        emit(state.copyWith(
          amountOfAllProducts: updatedMap,
        ));
      }
    }
  }

  FutureOr<void> _logot(
      LogoutEvent event, Emitter<AllProductsState> emit) async {
    await userCartDataBaseClearUsecase(
        UserCartDataBaseClearParams(event.tableName));
    final result = await cacheClearUsecase(CacheClearParams(event.cacheKey));
    result.fold(
      (l) => emit(state.copyWith(allProductsErrorMessage: l.message)),
      (r) => emit(
        state.copyWith(cacheCleared: r),
      ),
    );
  }

  FutureOr<void> _changeAmountOfProductsInCart(
      AmountOfProductsInCartEvent event, Emitter<AllProductsState> emit) async {
    if (event.isIncrement) {
      int newAmount = event.amount + 1;
      final result = await amountUpdateInDataBaseUsecase(
        AmountUpdateInDataBaseParams(
            databaseId: event.dataBaseProductsId, amount: newAmount),
      );
      result.fold(
          (l) => emit(state.copyWith(allProductsErrorMessage: l.message)),
          (r) => emit(state.copyWith(deleteProductNumber: r)));
    } else {
      int newAmount = event.amount - 1;
      final result = await amountUpdateInDataBaseUsecase(
        AmountUpdateInDataBaseParams(
            databaseId: event.dataBaseProductsId,
            amount: newAmount <= 1 ? 1 : newAmount),
      );
      result.fold(
          (l) => emit(state.copyWith(allProductsErrorMessage: l.message)),
          (r) => emit(state.copyWith(deleteProductNumber: r)));
    }
  }
}
