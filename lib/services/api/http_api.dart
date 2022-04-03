import 'dart:io';

import 'package:agro_mall/app/app.logger.dart';
import 'package:agro_mall/model/user_model.dart';
import 'package:agro_mall/services/api/api.dart';
import 'package:agro_mall/services/base/failure.dart';
import 'package:agro_mall/utilities/user_params.dart';
import 'package:http/http.dart';

class HttpApiService implements ApiService {
  final _log = getLogger('HttpApiService');
  @override
  Future getUser() async {
    var client = Client();
    try {
      var url = Uri.parse('https://engineering.league.dev/challenge/api/users');
      var response = await client.get(
        url,
        headers: {'x-access-token': '5ECDDC3A21CE53428227A2125B7FCC71'},
      );
      _log.d(response.statusCode);
      if (response.statusCode == 200) {
        _log.i(response.body);
        return userFromJson(response.body);
      }
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
