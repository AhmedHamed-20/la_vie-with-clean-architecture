part of 'all_products_bloc.dart';

abstract class BaseAllProductsEvent extends Equatable {
  const BaseAllProductsEvent();
}

class AllProductsEvent extends BaseAllProductsEvent {
  final String accessToken;

  const AllProductsEvent(this.accessToken);
  @override
  List<Object?> get props => [accessToken];
}
