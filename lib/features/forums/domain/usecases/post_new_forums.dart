import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/forums_repositories.dart';

class ForumsPostUscase extends UseCase<void, ForumsPostParams> {
  final ForumsRepositories forumRepository;

  ForumsPostUscase(this.forumRepository);

  @override
  Future<Either<Failure, void>> call(ForumsPostParams params) async {
    return await forumRepository.postNewForum(params);
  }
}

class ForumsPostParams extends Equatable {
  final String accessToken;
  final String title;
  final String description;
  final String imageBae64;

  const ForumsPostParams(
      {required this.title,
      required this.description,
      required this.imageBae64,
      required this.accessToken});

  @override
  List<Object?> get props => [title, description, imageBae64, accessToken];
}
