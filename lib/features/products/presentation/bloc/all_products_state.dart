part of 'all_products_bloc.dart';

class AllProductsState extends Equatable {
  final CartRequestState cartRequestState;
  final List<AllProductsEntitie> allProductsEntitie;
  final List activeEntitie;
  final int currentActiveTabIndex;
  final List<ProductsDatabaseEntitie> productsDatabaseEntitie;
  final int deleteProductNumber;
  final AllProductsRequestState requestState;
  final String allProductsErrorMessage;
  final int? statusCode;

  final Map<String, int> amountOfAllProducts;
  final bool cacheCleared;
  final bool productExist;
  final int totalCartPrice;
  const AllProductsState({
    this.totalCartPrice = 0,
    this.cacheCleared = false,
    this.statusCode,
    this.activeEntitie = const [],
    this.currentActiveTabIndex = 0,
    this.cartRequestState = CartRequestState.loading,
    this.productsDatabaseEntitie = const [],
    this.deleteProductNumber = -1,
    this.allProductsEntitie = const [],
    this.allProductsErrorMessage = '',
    this.requestState = AllProductsRequestState.idle,
    this.amountOfAllProducts = const {},
    this.productExist = false,
  });

  AllProductsState copyWith({
    int? totalCartPrice,
    bool? productExist,
    bool? cacheCleared,
    int? statusCode,
    Map<String, int>? amountOfAllProducts,
    List? activeEntitie,
    int? currentActiveTabIndex,
    CartRequestState? cartRequestState,
    List<AllProductsEntitie>? allProductsEntitie,
    List<ProductsDatabaseEntitie>? productsDatabaseEntitie,
    int? deleteProductNumber,
    AllProductsRequestState? requestState,
    String? allProductsErrorMessage,
    BLogsEntitie? bLogsEntitie,
  }) {
    return AllProductsState(
      totalCartPrice: totalCartPrice ?? this.totalCartPrice,
      productExist: productExist ?? this.productExist,
      cacheCleared: cacheCleared ?? this.cacheCleared,
      statusCode: statusCode ?? this.statusCode,
      amountOfAllProducts: amountOfAllProducts ?? this.amountOfAllProducts,
      activeEntitie: activeEntitie ?? this.activeEntitie,
      currentActiveTabIndex:
          currentActiveTabIndex ?? this.currentActiveTabIndex,
      cartRequestState: cartRequestState ?? this.cartRequestState,
      deleteProductNumber: deleteProductNumber ?? this.deleteProductNumber,
      productsDatabaseEntitie:
          productsDatabaseEntitie ?? this.productsDatabaseEntitie,
      allProductsEntitie: allProductsEntitie ?? this.allProductsEntitie,
      requestState: requestState ?? this.requestState,
      allProductsErrorMessage:
          allProductsErrorMessage ?? this.allProductsErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        totalCartPrice,
        productExist,
        amountOfAllProducts,
        cacheCleared,
        statusCode,
        allProductsErrorMessage,
        allProductsEntitie,
        requestState,
        productsDatabaseEntitie,
        deleteProductNumber,
        activeEntitie,
        currentActiveTabIndex,
      ];
}
