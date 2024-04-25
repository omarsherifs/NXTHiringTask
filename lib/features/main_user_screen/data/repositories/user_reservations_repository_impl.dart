import 'package:dartz/dartz.dart';
import 'package:nxthiringtask/core/errors/error.dart';
import 'package:nxthiringtask/features/main_user_screen/data/data_sources/user_reservation_base_data_source.dart';
import 'package:nxthiringtask/features/main_user_screen/domain/entities/user_reservation_entity.dart';
import 'package:nxthiringtask/features/main_user_screen/domain/repositories/base_user_reservations_repository.dart';

class UserReservationRepository implements BaseUserReservationsRepository {
  UserReservationRepository(this._baseUserReservationDataSource);
  final BaseUserReservationDataSource _baseUserReservationDataSource;
  @override
  Future<Either<UserReservationEntity, AppError>> getReservationData() async {
    try {
      final data =
          await _baseUserReservationDataSource.getUserReservationsData();
      return Left(data);
    } on Exception catch (ex) {
      return Right(AppError(ex.toString()));
    }
  }
}
