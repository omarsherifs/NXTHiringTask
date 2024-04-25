import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nxthiringtask/core/services/dependacny_injection_service.dart';
import 'package:nxthiringtask/features/main_user_screen/domain/entities/user_reservation_entity.dart';
import 'package:nxthiringtask/features/main_user_screen/domain/usecases/get_user_reservations_usecase.dart';

part 'reservations_state.dart';

class ReservationsCubit extends Cubit<ReservationsState> {
  ReservationsCubit() : super(ReservationsInitial()) {
    getReservationData();
  }
  UserReservationEntity? userReservationEntity;
  Future<void> getReservationData() async {
    try {
      emit(ReservationsLoading());
      final result = await sl<GetUserReservationUseCase>().call();
      result.fold((l) {
        userReservationEntity = l;
        emit(ReservationsSuccess());
      }, (r) {
        emit(ReservationsError(r.message));
      });
    } catch (e) {
      emit(ReservationsError("Something went wrong"));
    }
  }
}
