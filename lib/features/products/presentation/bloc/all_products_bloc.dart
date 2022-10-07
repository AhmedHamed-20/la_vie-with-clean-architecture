import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/entities/products_database_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/delete_product_from_database.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/usecases/get_all_products_from_database.dart';
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
      this.productsInsertionIntoDatabaseUsecase)
      : super(const AllProductsState()) {
    on<AllProductsEvent>(_getAllProducts);
    on<ProductDeletionFromDatabaseByIdEvent>(_deleteProductById);
    on<DatabaseInsertionEvent>(_insertProductIntoDatabase);
    on<AllProductsFromDatabaseEvent>(_getAllProductsFromDatabase);
  }
  AllProductsUseCase allProductsUseCase;
  PeroductsFromDatabaseUsecase peroductsFromDatabaseUsecase;
  ProductsInsertionIntoDatabaseUsecase productsInsertionIntoDatabaseUsecase;
  ProductDeletionFromDatabaseByIdUsecase productDeletionFromDatabaseByIdUsecase;
  FutureOr<void> _getAllProducts(
      AllProductsEvent event, Emitter<AllProductsState> emit) async {
    final result =
        await allProductsUseCase(AllproudctsParams(event.accessToken));
    emit(state.copyWith(requestState: AllProductsRequestState.loading));

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
}
