

import 'package:dio/dio.dart';
import 'package:wellness_mobile/data/domain_set.dart';
import 'package:wellness_mobile/data/models/article/mental_model.dart';

class MeditationRepository {
  final Dio _dio = Dio();

  Future<List<MeditationModel>> getMeditation() async {
    final response = await _dio.get(meditationApi);

    var list = response.data
        .map((items) => MeditationModel.fromJson(items))
        .cast<MeditationModel>()
        .toList();

    return list;
  }
}