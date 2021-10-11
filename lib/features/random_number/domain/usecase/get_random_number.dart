import 'package:dartz/dartz.dart';
import 'package:tdd_full_project/core/error/failure.dart';
import 'package:tdd_full_project/core/usecase/usecase.dart';
import 'package:tdd_full_project/features/random_number/domain/entity/random_number.dart';
import 'package:tdd_full_project/features/random_number/domain/repository/random_number_repository.dart';


class GetRandomNumber implements UseCase<RandomNumber, NoParameters> {
  final RandomNumberRepository repository;

  GetRandomNumber(this.repository);

  @override
  Future<Either<Failure, RandomNumber>> call(NoParameters params) async {
    return await repository.getRandomNumber();
  }
}