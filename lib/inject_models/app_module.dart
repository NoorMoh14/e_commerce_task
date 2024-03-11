
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../network/webservice.dart';


@module
abstract class AppModule {

  @Named("BaseUrl")
  String get baseUrl => 'https://fakestoreapi.com/';

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));
}
