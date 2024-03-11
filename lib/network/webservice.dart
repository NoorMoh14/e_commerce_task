import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod/riverpod.dart' as Response;
import 'package:task/dto_models/home_model_dto.dart';
import 'package:task/network/requests_url.dart';

import '../helpers/short_term_manager.dart';

@Injectable()
class Webservice {
  final Dio _dio;

  Webservice(this._dio);


  Stream<Response.AsyncValue> postLoginWebservice(String email, String password) async* {
    try {
      yield const Response.AsyncValue.loading();
    } on DioException catch (error, stacktrace) {
      yield Response.AsyncValue.error(error, stacktrace);
    }
  }

  Stream<Response.AsyncValue> getWebservice() async* {
    try {
      yield const Response.AsyncValue.loading();
      var response =
      await _dio.get('${_dio.options.baseUrl}products');
      if (response.statusCode == 200) {
        final List<dynamic>?  data = response.data;
        if (data != null) {
          for (var item in data) {
            HomeModelDto homeModelDto = HomeModelDto.fromJson(item);
            yield Response.AsyncValue.data(homeModelDto.toMap());
          }
        } else {
          yield Response.AsyncValue.error('Invalid API response', StackTrace.empty);
        }

      } else {
        yield const Response.AsyncValue.error(DioException, StackTrace.empty);
      }
    } on DioException catch (error, stacktrace) {
      yield Response.AsyncValue.error(error, stacktrace);
    }
  }

}