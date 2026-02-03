import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quotes_generator_app/core/utils/api_services.dart';
import 'package:quotes_generator_app/features/home/data/repos/home_repo_implementation.dart';

//creating an instance of getIt
final getIt = GetIt.instance;

void setUpGetItServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));

  getIt.registerSingleton(
    HomeRepoImplementation(apiServices: getIt.get<ApiServices>()),
  );
}
