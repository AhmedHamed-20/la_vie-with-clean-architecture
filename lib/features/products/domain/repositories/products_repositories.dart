import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/all_products_entitie.dart';
import '../usecases/get_all_products_usecase.dart';

abstract class AllProductsRepositories {
  Future<Either<Failure, List<AllProductsEntitie>>> getAllProducts(
      AllproudctsParams params);
}
