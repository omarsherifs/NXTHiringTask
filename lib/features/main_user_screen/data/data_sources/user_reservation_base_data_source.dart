// ignore_for_file: one_member_abstracts

import 'package:nxthiringtask/features/main_user_screen/domain/entities/user_reservation_entity.dart';

abstract class BaseUserReservationDataSource {
  Future<UserReservationEntity> getUserReservationsData();
}
