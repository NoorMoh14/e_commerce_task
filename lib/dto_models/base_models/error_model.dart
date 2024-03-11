import 'package:dio/dio.dart';

class ErrorModel{

  DioError? dioError;
  String? msg;

  ErrorModel({this.dioError,this.msg});
}