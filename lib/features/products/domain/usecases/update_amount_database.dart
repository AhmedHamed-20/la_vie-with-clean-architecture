import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/core/error/failures.dart';
import 'package:la_vie_with_clean_architecture/core/usecases/usecases.dart';
import 'package:la_vie_with_clean_architecture/features/products/domain/repositories/products_repositories.dart';

class AmountUpdateInDataBaseUsecase
    extends UseCase<int, AmountUpdateInDataBaseParams> {
  final AllProductsRepositories allProductsRepositories;

  AmountUpdateInDataBaseUsecase(this.allProductsRepositories);

  @override
  Future<Either<Failure, int>> call(AmountUpdateInDataBaseParams params) async {
    return await allProductsRepositories.updateAmountInCartDatabase(params);
  }
}

class AmountUpdateInDataBaseParams extends Equatable {
  final int databaseId;
  final int amount;

  const AmountUpdateInDataBaseParams(
      {required this.databaseId, required this.amount});

  @override
  List<Object?> get props => [amount, databaseId];
}
