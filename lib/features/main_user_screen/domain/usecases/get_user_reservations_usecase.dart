import 'package:dartz/dartz.dart';
import 'package:nxthiringtask/core/errors/error.dart';
import 'package:nxthiringtask/core/usecases/usecases.dart';
import 'package:nxthiringtask/features/main_user_screen/domain/entities/user_reservation_entity.dart';
import 'package:nxthiringtask/features/main_user_screen/domain/repositories/base_user_reservations_repository.dart';

class GetUserReservationUseCase extends BaseUseCase<UserReservationEntity> {
  GetUserReservationUseCase({
    required this.baseUserReservationsRepository,
  });
  BaseUserReservationsRepository baseUserReservationsRepository;

  @override
  Future<Either<UserReservationEntity, AppError>> call() async {
    return baseUserReservationsRepository.getReservationData();
  }
}
