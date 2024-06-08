import 'package:dio/dio.dart';

List<String> getMessageErrors(DioException e) {
  try {
    var errorResponse = e.response;
    if (errorResponse == null) {
      return ["Проблема с сетью"];
    }

    if (errorResponse.statusCode == 403) {
      return ["Пожалуйста авторизуйтесь!"];
    }

    Map<String, dynamic> data = errorResponse.data;

    print(data);

    try {
      var values = data.values.map((e) => List.from(e).cast<String>()).toList();

      List<String> errors = [];
      for (var element in values) {
        errors.addAll(element);
      }

      return errors;
    } catch (e) {
      return data.values.map((e) => e).cast<String>().toList();
    }
  } catch (e) {
    return ["Неизвестная ошибка!"];
  }
}

bool isExit(DioException e) =>
    e.response != null && e.response!.statusCode == 403;
