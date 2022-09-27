part of 'all_products_bloc.dart';

class AllProductsState extends Equatable {
  final List<AllProductsEntitie> allProductsEntitie;
  final AllProductsRequestState requestState;
  final String allProductsMessage;

  const AllProductsState({
    this.allProductsEntitie = const [],
    this.allProductsMessage = '',
    this.requestState = AllProductsRequestState.idle,
  });

  AllProductsState copyWith({
    List<AllProductsEntitie>? allProductsEntitie,
    AllProductsRequestState? requestState,
    String? allProductsMessage,
  }) {
    return AllProductsState(
        allProductsEntitie: allProductsEntitie ?? this.allProductsEntitie,
        requestState: requestState ?? this.requestState,
        allProductsMessage: allProductsMessage ?? this.allProductsMessage);
  }

  @override
  List<Object> get props => [
        allProductsMessage,
        allProductsEntitie,
        requestState,
      ];
}
