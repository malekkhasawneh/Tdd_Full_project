import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_full_project/core/error/failure.dart';


abstract class UseCase<Type, Parameters> {
  Future<Either<Failure, Type>> call(Parameters params);
}

class NoParameters extends Equatable {
  @override
  List<Object> get props => [];
}