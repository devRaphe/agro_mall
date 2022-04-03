import 'package:agro_mall/app/app.locator.dart';
import 'package:agro_mall/app/app.logger.dart';
import 'package:agro_mall/model/user_model.dart';
import 'package:agro_mall/services/api/api.dart';
import 'package:agro_mall/services/base/failure.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _log = getLogger('HomeViewModel');
  final _snackbarService = locator<SnackbarService>();
  List<User> posts = [];
  Future getUser() async {
    try {
      setBusy(true);
      posts = await _apiService.getUser();
    } on Failure catch (ex) {
      _snackbarService.showSnackbar(message: ex.message);
    } catch (ex) {
      _log.e(ex);
    } finally {
      setBusy(false);
    }
  }
}
