
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'domain/local/preferences/local_storage.dart';
import 'domain/local/preferences/storage_controller.dart';
import 'domain/server/http_client/request_handler.dart';

final locator = GetIt.instance;

Future<void> init(LocalStorage localStorage) async {

  // ==# Register dependencies with GetIt for core services
  locator.registerLazySingleton<LocalStorage>(() => localStorage);
  locator.registerLazySingleton<RequestHandler>(() => RequestHandler(dio: Dio()));

  Get.put(LocalStorageController());

  // ==# Register GetIt services within GetX for further access
  Get.lazyPut(() => locator<RequestHandler>(), fenix: true);
  Get.lazyPut(() => locator<LocalStorageController>(), fenix: true);

}