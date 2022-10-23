import 'package:dartz/dartz.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/usecases/get_product_by_id.dart';

import '../entities/product_by_id_entitie.dart';

abstract class ProductByIdRepository {
  Future<Either<Failure, ProductByIdEntitie>> getProductById(
      ProductByIdParams params);
}
