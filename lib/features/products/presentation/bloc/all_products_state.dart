part of 'all_products_bloc.dart';

class AllProductsState extends Equatable {
  final UserDataEntitie? userDataEntitie;
  final CartRequestState cartRequestState;
  final List<AllProductsEntitie> allProductsEntitie;
  final List<ProductsDatabaseEntitie> productsDatabaseEntitie;
  final int deleteProductNumber;
  final AllProductsRequestState requestState;
  final String allProductsMessage;
  final BLogsEntitie? bLogsEntitie;
  final String accessToken;
  const AllProductsState({
    this.accessToken = '',
    this.userDataEntitie,
    this.cartRequestState = CartRequestState.loading,
    this.productsDatabaseEntitie = const [],
    this.deleteProductNumber = -1,
    this.allProductsEntitie = const [],
    this.allProductsMessage = '',
    this.requestState = AllProductsRequestState.idle,
    this.bLogsEntitie,
  });

  AllProductsState copyWith({
    String? accessToken,
    UserDataEntitie? userDataEntitie,
    CartRequestState? cartRequestState,
    List<AllProductsEntitie>? allProductsEntitie,
    List<ProductsDatabaseEntitie>? productsDatabaseEntitie,
    int? deleteProductNumber,
    AllProductsRequestState? requestState,
    String? allProductsMessage,
    BLogsEntitie? bLogsEntitie,
  }) {
    return AllProductsState(
      accessToken: accessToken ?? this.accessToken,
      userDataEntitie: userDataEntitie ?? this.userDataEntitie,
      cartRequestState: cartRequestState ?? this.cartRequestState,
      deleteProductNumber: deleteProductNumber ?? this.deleteProductNumber,
      productsDatabaseEntitie:
          productsDatabaseEntitie ?? this.productsDatabaseEntitie,
      allProductsEntitie: allProductsEntitie ?? this.allProductsEntitie,
      requestState: requestState ?? this.requestState,
      allProductsMessage: allProductsMessage ?? this.allProductsMessage,
      bLogsEntitie: bLogsEntitie ?? this.bLogsEntitie,
    );
  }

  @override
  List<Object?> get props => [
        userDataEntitie,
        allProductsMessage,
        allProductsEntitie,
        requestState,
        bLogsEntitie,
        productsDatabaseEntitie,
        deleteProductNumber,
        accessToken,
      ];
}
