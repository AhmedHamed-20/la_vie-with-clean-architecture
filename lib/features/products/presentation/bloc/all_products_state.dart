part of 'all_products_bloc.dart';

class AllProductsState extends Equatable {
  final List<AllProductsEntitie> allProductsEntitie;
  final AllProductsRequestState requestState;
  final String allProductsMessage;
  final BLogsEntitie? bLogsEntitie;
  const AllProductsState({
    this.allProductsEntitie = const [],
    this.allProductsMessage = '',
    this.requestState = AllProductsRequestState.idle,
    this.bLogsEntitie,
  });

  AllProductsState copyWith({
    List<AllProductsEntitie>? allProductsEntitie,
    AllProductsRequestState? requestState,
    String? allProductsMessage,
    BLogsEntitie? bLogsEntitie,
  }) {
    return AllProductsState(
      allProductsEntitie: allProductsEntitie ?? this.allProductsEntitie,
      requestState: requestState ?? this.requestState,
      allProductsMessage: allProductsMessage ?? this.allProductsMessage,
      bLogsEntitie: bLogsEntitie ?? this.bLogsEntitie,
    );
  }

  @override
  List<Object?> get props => [
        allProductsMessage,
        allProductsEntitie,
        requestState,
        bLogsEntitie,
      ];
}
