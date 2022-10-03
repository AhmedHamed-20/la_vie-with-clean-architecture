import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/all_products_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/usecases/get_all_products_usecase.dart';

abstract class AllProductsRepositories {
  Future<Either<Failure, List<AllProductsEntitie>>> getAllProducts(
      AllproudctsParams params);
}