import 'package:agro_mall/utilities/user_params.dart';

abstract class ApiService {
  Future getUser();
  Future loginUser(UserParams params);
}
