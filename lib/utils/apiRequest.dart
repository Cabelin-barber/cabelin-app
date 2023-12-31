import 'package:dio/dio.dart';

class Api {

  static final dio = Dio(
    BaseOptions(
      baseUrl: "http://ec2-3-129-45-22.us-east-2.compute.amazonaws.com:8080/api-cabelin/v1",
    )
  );
}