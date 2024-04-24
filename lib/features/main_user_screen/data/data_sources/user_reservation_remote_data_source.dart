import 'package:nxthiringtask/core/network/api_caller.dart';
import 'package:nxthiringtask/features/main_user_screen/data/data_sources/user_reservation_base_data_source.dart';
import 'package:nxthiringtask/features/main_user_screen/data/models/user_reservation_model.dart';

class UserReservationRemoteDataSource implements BaseUserReservationDataSource {
  @override
  Future<UserReservationModel> getUserReservationsData() async {
    final response = await ApiCaller().getData(NetworkConstants.userDataPath);
    final data = response.data;
    return UserReservationModel.fromJson(data as Map<String, dynamic>);
  }
}
