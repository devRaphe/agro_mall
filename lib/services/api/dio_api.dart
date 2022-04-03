import 'dart:io';

import 'package:agro_mall/app/app.logger.dart';
import 'package:agro_mall/model/user_model.dart';
import 'package:agro_mall/services/api/api.dart';
import 'package:agro_mall/utilities/user_params.dart';
import 'package:dio/dio.dart';

import '../base/failure.dart';

class DioApiService implements ApiService {
  final _log = getLogger('DioApiService');
  @override
  Future getUser() async {
    var dioClient = Dio();
    try {
      var response = await dioClient.get(
        'https://engineering.league.dev/challenge/api/users',
        options: Options(
          method: 'Get',
          headers: {'x-access-token': '5ECDDC3A21CE53428227A2125B7FCC71'},
        ),
      );
      _log.d(response.statusCode);
      _log.d(response.statusMessage);

      if (response.statusCode == 200) {
        _log.d(response.data);
        return userFromJson(response.data);
      }
    } on DioError catch (ex) {
      throw Failure(ex.message);
    } on SocketException {
      throw Failure('You are not connected to the internet');
    } on FormatException {
      throw Failure('Format Exception');
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future loginUser(UserParams params) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }
}
