import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/utl/request_state.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/get_all_products_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/usecases/get_all_products_usecase.dart';
part 'all_products_event.dart';
part 'all_products_state.dart';

class AllProductsBloc extends Bloc<BaseAllProductsEvent, AllProductsState> {
  AllProductsBloc(this.allProductsUseCase) : super(const AllProductsState()) {
    on<AllProductsEvent>(_getAllProducts);
  }
  AllProductsUseCase allProductsUseCase;
  FutureOr<void> _getAllProducts(
      AllProductsEvent event, Emitter<AllProductsState> emit) async {
    final result =
        await allProductsUseCase(AllproudctsParams(event.accessToken));
    emit(state.copyWith(requestState: RequestState.loading));

    result.fold(
      (l) => emit(state.copyWith(
          allProductsMessage: l.message, requestState: RequestState.error)),
      (r) => emit(
        state.copyWith(
          allProductsEntitie: r,
          requestState: RequestState.loaded,
        ),
      ),
    );
  }
}
