import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tdd_full_project/core/error/exceptions.dart';
import 'package:tdd_full_project/features/random_number/data/models/random_number_model.dart';


abstract class RandomNumberRemoteDataSource {
  Future<RandomNumberModel> getConcreteRandomNumber(int number);

  Future<RandomNumberModel> getRandomNumber();
}

class RandomNumberRemoteDataSourceImpl implements RandomNumberRemoteDataSource {
  final http.Client client;

  RandomNumberRemoteDataSourceImpl({required this.client});

  @override
  Future<RandomNumberModel> getConcreteRandomNumber(int number) =>
      _geRandomNumberFromUrl('http://numbersapi.com/$number');

  @override
  Future<RandomNumberModel> getRandomNumber() =>
      _geRandomNumberFromUrl('http://numbersapi.com/random');

  Future<RandomNumberModel> _geRandomNumberFromUrl(String url) async {
    final response = await client.get(
      url as Uri,
    );

    if (response.statusCode == 200) {
      return RandomNumberModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}