
import 'package:dio/dio.dart';
import 'package:wellness_mobile/data/domain_set.dart';
import 'package:wellness_mobile/data/models/food/food_model.dart';

class FoodsRepository {
  final Dio _dio = Dio();

  Future<List<FoodModel>> getFoods() async {
    final response = await _dio.get(foodApi);

    var list = response.data
        .map((items) => FoodModel.fromJson(items))
        .cast<FoodModel>()
        .toList();

    return list;
  }
}