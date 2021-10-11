import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tdd_full_project/core/error/failure.dart';
import 'package:tdd_full_project/core/usecase/usecase.dart';
import 'package:tdd_full_project/features/random_number/domain/entity/random_number.dart';
import 'package:tdd_full_project/features/random_number/domain/repository/random_number_repository.dart';


class GetConcreteRandomNumber implements UseCase<RandomNumber, Params> {
  final RandomNumberRepository repository;

  GetConcreteRandomNumber(this.repository);

  @override
  Future<Either<Failure, RandomNumber>> call(Params params) async {
    return await repository.getConcreteRandomNumber(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({required this.number});

  @override
  List<Object> get props => [number];
}