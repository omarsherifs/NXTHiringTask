// ignore_for_file: strict_raw_type

import 'package:dio/dio.dart';
import 'package:nxthiringtask/core/errors/exceptions.dart';

class ApiCaller {
  Dio dio = Dio();

// i Added only get request method because we only have one get request
  Future<Response> getData(String path) async {
    try {
      return dio.get(
        path,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${NetworkConstants.accessToken}',
          },
        ),
      );
    } on DioException catch (e) {
      throw ServerException(
        statusCode: e.response?.statusCode ?? 500,
        message: e.message ?? '--',
      );
    }
  }
}

class NetworkConstants {
  static String userDataPath =
      'https://qa-testing-backend-293b1363694d.herokuapp.com/api/v3/mobile-guests/user-events';
  static String accessToken =
      'eyJhbGciOiJSUzI1NiJ9.eyJpZCI6MzAzLCJ0eXBlIjoidXNlciIsInJhbiI6IkJORU5WSVBOTlFUWVBMS0tVQ0JWIiwic3RhdHVzIjoxfQ.YGV-jGKZj1Lp4SqlM3aiF6Aov6YVF6lZRMpKvx_Zdrpjj4C1zE-JSTKtjVboQ9de58TUViyVOc4JwiktjF_4yxnYzIrw449s584j2GiqUpxfp6OPmfAj8BAbfN_M4RoU5PXEjhcNVh5uNRtxtvxZtpECrl72_22T4he3LbqISMNHzVh5eprIKIFLt_pM7cyRKt3Njf8I89CLnq5nUpiDHnMMForamKq9jubmiYPOHpFvijEE3-jusRk0F1T32zMY_0AELXnpqhbbx6HtmMdxBahnrUNyznacdVwaSrNus8vX01N8zEcfRvkRzYuqjnZXr9jrm2iriHq80iicUG99GQ';
}
