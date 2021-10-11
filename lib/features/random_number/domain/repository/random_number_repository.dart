import 'package:dartz/dartz.dart';
import 'package:tdd_full_project/core/error/failure.dart';
import 'package:tdd_full_project/features/random_number/domain/entity/random_number.dart';

abstract class RandomNumberRepository {
  Future<Either<Failure, RandomNumber>> getConcreteRandomNumber(int number);

  Future<Either<Failure, RandomNumber>> getRandomNumber();
}
