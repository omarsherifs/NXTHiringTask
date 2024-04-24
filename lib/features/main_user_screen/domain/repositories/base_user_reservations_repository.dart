// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:nxthiringtask/core/errors/error.dart';
import 'package:nxthiringtask/features/main_user_screen/domain/entities/user_reservation_entity.dart';

abstract class BaseUserReservationsRepository {
  Future<Either<UserReservationEntity, AppError>> getReservationData();
}
