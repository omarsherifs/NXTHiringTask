// ignore_for_file: inference_failure_on_untyped_parameter, lines_longer_than_80_chars, avoid_dynamic_calls

import 'package:nxthiringtask/features/main_user_screen/domain/entities/user_reservation_entity.dart';

class UserReservationModel extends UserReservationEntity {
  UserReservationModel({
    super.reservations,
  });

  factory UserReservationModel.fromJson(Map<String, dynamic> json) => UserReservationModel(
        reservations: json['reservations'] == null
            ? []
            : (json['reservations'] as List)
                .map(
                  (element) => ReservationModel.fromJson(element as Map<String, dynamic>),
                )
                .toList() as List<ReservationModel>,
      );
}

class ReservationModel extends ReservationEntity {
  ReservationModel({
    super.id,
    super.startDate,
    super.endDate,
    super.stays,
    super.userTickets,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) => ReservationModel(
        id: json['id'] as int?,
        startDate: json['start_date'] == null ? null : DateTime.parse(json['start_date'] as String),
        endDate: json['end_date'] == null ? null : DateTime.parse(json['end_date'] as String),
        stays: json['stays'] == null
            ? []
            : (json['stays'] as List)
                .map(
                  (element) => StayModel.fromJson(element as Map<String, dynamic>),
                )
                .toList() as List<StayModel>,
        userTickets: json['user_tickets'] == null
            ? []
            : (json['user_tickets'] as List)
                .map(
                  (element) => UserTicketModel.fromJson(element as Map<String, dynamic>),
                )
                .toList() as List<UserTicketModel>,
      );
}

class StayModel extends StayEntity {
  StayModel({
    super.name,
    super.description,
    super.lat,
    super.lng,
    super.address,
    super.checkIn,
    super.checkOut,
    super.stars,
    super.stayImages,
    super.amenities,
    super.rooms,
  });

  factory StayModel.fromJson(Map<String, dynamic> json) => StayModel(
        name: json['name'] as String?,
        description: json['description'] as String?,
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
        address: json['address'] as String?,
        checkIn: json['check_in'] as String?,
        checkOut: json['check_out'] as String?,
        stars: json['stars'] as int?,
        stayImages: List<String>.from(json['stay_images'] as List),
        amenities: json['amenities'] as String?,
        rooms: json['rooms'] == null
            ? []
            : (json['rooms'] as List)
                .map(
                  (element) => RoomModel.fromJson(element as Map<String, dynamic>),
                )
                .toList() as List<RoomModel>,
      );
}

class RoomModel extends RoomEntity {
  RoomModel({
    super.roomNumber,
    super.roomCapacity,
    super.roomTypeName,
    super.stayName,
    super.guests,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        roomNumber: json['room_number'] as String?,
        roomCapacity: json['room_capacity'] as int?,
        roomTypeName: json['room_type_name'] as String?,
        stayName: json['stay_name'] as String?,
        guests: json['guests'] == null
            ? []
            : ((json['guests'] as List)
                .map(
                  (element) => TicketUserModel.fromJson(element as Map<String, dynamic>),
                )
                .toList()) as List<TicketUserModel>,
      );
}

class TicketUserModel extends TicketUserEntity {
  TicketUserModel({
    super.firstName,
    super.lastName,
    super.avatar,
    super.isUser,
  });

  factory TicketUserModel.fromJson(Map<String, dynamic> json) => TicketUserModel(
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        avatar: json['avatar'] as String?,
        isUser: json['is_user'] == null ? null : json['is_user'] as bool?,
      );
}

class UserTicketModel extends UserTicketEntity {
  UserTicketModel({
    super.ticketId,
    super.seat,
    super.ticketSystemId,
    super.ticketTypeName,
    super.ticketUserData,
    super.gate,
  });

  factory UserTicketModel.fromJson(Map<String, dynamic> json) => UserTicketModel(
        ticketId: json['ticket_id'] as int?,
        seat: json['seat'] as String?,
        ticketSystemId: json['ticket_system_id'] as String?,
        ticketTypeName: json['ticket_type_name'] as String?,
        ticketUserData: json['ticket_user_data'] == null
            ? null
            : TicketUserModel.fromJson(
                json['ticket_user_data'] as Map<String, dynamic>,
              ),
        gate: json['gate'] as String?,
      );
}
