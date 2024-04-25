import 'package:get_it/get_it.dart';
import 'package:nxthiringtask/features/main_user_screen/data/data_sources/user_reservation_base_data_source.dart';
import 'package:nxthiringtask/features/main_user_screen/data/data_sources/user_reservation_remote_data_source.dart';
import 'package:nxthiringtask/features/main_user_screen/data/repositories/user_reservations_repository_impl.dart';
import 'package:nxthiringtask/features/main_user_screen/domain/repositories/base_user_reservations_repository.dart';
import 'package:nxthiringtask/features/main_user_screen/domain/usecases/get_user_reservations_usecase.dart';

final sl = GetIt.instance;

class DependencyInjectionServices {
  void init() {
    initHome();
  }

  void initHome() {
    // init Repositories
    sl
      ..registerLazySingleton<BaseUserReservationsRepository>(
        () => UserReservationRepository(sl()),
      )

      // init Use Cases
      ..registerLazySingleton<GetUserReservationUseCase>(
        () => GetUserReservationUseCase(
          baseUserReservationsRepository: sl(),
        ),
      )

      // init Data Sources
      ..registerLazySingleton<BaseUserReservationDataSource>(
        UserReservationRemoteDataSource.new,
      );
  }
}
