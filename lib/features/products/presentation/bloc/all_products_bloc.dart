import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/entities/products_database_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/entities/user_data.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/delete_product_from_database.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/get_access_token_from_cache.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/get_all_products_from_database.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/get_userdata_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/insert_product_into_database.dart';

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
    this.userDataUsecase,
    this.accessTokenFromCacheUsecase,
  ) : super(const AllProductsState()) {
    on<AllProductsEvent>(_getAllProducts);
    on<ProductDeletionFromDatabaseByIdEvent>(_deleteProductById);
    on<DatabaseInsertionEvent>(_insertProductIntoDatabase);
    on<GetUserDataEvent>(_getUserData);
    on<AllProductsFromDatabaseEvent>(_getAllProductsFromDatabase);
    on<GetAccessTokenFromCacheEvent>(_getAccessTokenFromCache);
    on<CurrentActiveTabIndexEvent>(_changeCurrentActiveTabIndex);
  }
  AllProductsUseCase allProductsUseCase;
  PeroductsFromDatabaseUsecase peroductsFromDatabaseUsecase;
  ProductsInsertionIntoDatabaseUsecase productsInsertionIntoDatabaseUsecase;
  ProductDeletionFromDatabaseByIdUsecase productDeletionFromDatabaseByIdUsecase;
  UserDataUsecase userDataUsecase;
  AccessTokenFromCacheUsecase accessTokenFromCacheUsecase;
  FutureOr<void> _getAllProducts(
      AllProductsEvent event, Emitter<AllProductsState> emit) async {
    final result =
        await allProductsUseCase(AllproudctsParams(event.accessToken));

    result.fold(
      (l) => emit(state.copyWith(
          allProductsMessage: l.message,
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
          allProductsMessage: l.message)),
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
    final result = await productsInsertionIntoDatabaseUsecase(
      DatabaseProductParams(
        description: event.description,
        imageUrl: event.imageUrl,
        name: event.name,
        price: event.price,
        productId: event.productId,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(
          cartRequestState: CartRequestState.error,
          allProductsMessage: l.message)),
      (r) => emit(
        state.copyWith(
          cartRequestState: CartRequestState.insertedSuccessfully,
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
          allProductsMessage: l.message)),
      (r) => emit(
        state.copyWith(
          cartRequestState: CartRequestState.loaded,
          productsDatabaseEntitie: r,
        ),
      ),
    );
  }

  FutureOr<void> _getUserData(
      GetUserDataEvent event, Emitter<AllProductsState> emit) async {
    final result = await userDataUsecase(
      UserDataParams(accessToken: event.accessToken),
    );
    result.fold(
      (l) => emit(state.copyWith(
          requestState: AllProductsRequestState.error,
          allProductsMessage: l.message)),
      (r) => emit(
        state.copyWith(
          userDataEntitie: r,
          requestState: AllProductsRequestState.userDataGetSuccess,
        ),
      ),
    );
  }

  FutureOr<void> _getAccessTokenFromCache(GetAccessTokenFromCacheEvent event,
      Emitter<AllProductsState> emit) async {
    emit(state.copyWith(requestState: AllProductsRequestState.loading));
    final result = await accessTokenFromCacheUsecase(
        AccessTokenFromCacheParams(event.key));

    result.fold(
        (l) => emit(state.copyWith(
            requestState: AllProductsRequestState.error,
            allProductsMessage: l.message)), (r) {
      accessToken = r;
      return emit(
        state.copyWith(
          accessToken: r,
          requestState: AllProductsRequestState.accessTokenGetSuccess,
        ),
      );
    });
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
}
