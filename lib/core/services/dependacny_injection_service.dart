import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class DependencyInjectionServices {
  void init() {
    initHome();
  }

  void initHome() {
    // init Repositories
    // sl
    //   ..registerLazySingleton<BaseListHrEmployeeRepository>(
    //     () => ImplListHrEmployeeRepository(sl()),
    //   )
    //   ..registerLazySingleton<BaseListItEmployeeRepository>(
    //     () => ImplListItEmployeeRepository(sl()),
    //   )
    //   // init Use Cases
    //   ..registerLazySingleton<ListHrDepartmentEmployeesUseCase>(
    //     () => ListHrDepartmentEmployeesUseCase(
    //       baseListHrEmployeeRepository: sl(),
    //     ),
    //   )
    //   ..registerLazySingleton<ListItDepartmentEmployeesUseCase>(
    //     () => ListItDepartmentEmployeesUseCase(
    //       baseListItEmployeeRepository: sl(),
    //     ),
    //   )

    //   // init Data Sources
    //   ..registerLazySingleton<BaseEmployeesDataSource>(
    //     RemoteEmployeesDataSource.new,
    //   );
  }
}
