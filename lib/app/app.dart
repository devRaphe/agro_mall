import 'package:agro_mall/UI/home/home_view.dart';
import 'package:agro_mall/services/api/api.dart';
import 'package:agro_mall/services/api/dio_api.dart';
import 'package:agro_mall/services/api/http_api.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

const bool USE_HTTP_SERVICE = true;

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
  ],
  dependencies: [
    LazySingleton(
      classType: USE_HTTP_SERVICE ? HttpApiService : DioApiService,
      asType: ApiService,
    ),
    LazySingleton(classType: SnackbarService),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
