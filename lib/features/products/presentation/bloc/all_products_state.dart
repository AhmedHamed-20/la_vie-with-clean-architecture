part of 'all_products_bloc.dart';

class AllProductsState extends Equatable {
  final UserDataEntitie? userDataEntitie;
  final CartRequestState cartRequestState;
  final List<AllProductsEntitie> allProductsEntitie;
  final List activeEntitie;
  final int currentActiveTabIndex;
  final List<ProductsDatabaseEntitie> productsDatabaseEntitie;
  final int deleteProductNumber;
  final AllProductsRequestState requestState;
  final String allProductsMessage;
  final String accessToken;
  const AllProductsState({
    this.activeEntitie = const [],
    this.currentActiveTabIndex = 0,
    this.accessToken = '',
    this.userDataEntitie,
    this.cartRequestState = CartRequestState.loading,
    this.productsDatabaseEntitie = const [],
    this.deleteProductNumber = -1,
    this.allProductsEntitie = const [],
    this.allProductsMessage = '',
    this.requestState = AllProductsRequestState.idle,
  });

  AllProductsState copyWith({
    List? activeEntitie,
    int? currentActiveTabIndex,
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
      activeEntitie: activeEntitie ?? this.activeEntitie,
      currentActiveTabIndex:
          currentActiveTabIndex ?? this.currentActiveTabIndex,
      accessToken: accessToken ?? this.accessToken,
      userDataEntitie: userDataEntitie ?? this.userDataEntitie,
      cartRequestState: cartRequestState ?? this.cartRequestState,
      deleteProductNumber: deleteProductNumber ?? this.deleteProductNumber,
      productsDatabaseEntitie:
          productsDatabaseEntitie ?? this.productsDatabaseEntitie,
      allProductsEntitie: allProductsEntitie ?? this.allProductsEntitie,
      requestState: requestState ?? this.requestState,
      allProductsMessage: allProductsMessage ?? this.allProductsMessage,
    );
  }

  @override
  List<Object?> get props => [
        userDataEntitie,
        allProductsMessage,
        allProductsEntitie,
        requestState,
        productsDatabaseEntitie,
        deleteProductNumber,
        accessToken,
        activeEntitie,
        currentActiveTabIndex,
      ];
}
