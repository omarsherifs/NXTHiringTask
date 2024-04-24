abstract class UserReservationEntity {
  UserReservationEntity({
    this.reservations,
  });

  final List<ReservationEntity>? reservations;
}

abstract class ReservationEntity {
  const ReservationEntity({
    this.id,
    this.startDate,
    this.endDate,
    this.stays,
    this.userTickets,
  });

  final int? id;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<StayEntity>? stays;
  final List<UserTicketEntity>? userTickets;
}

abstract class StayEntity {
  StayEntity({
    this.name,
    this.description,
    this.lat,
    this.lng,
    this.address,
    this.checkIn,
    this.checkOut,
    this.stars,
    this.stayImages,
    this.amenities,
    this.rooms,
  });
  final String? name;
  final String? description;
  final String? lat;
  final String? lng;
  final String? address;
  final String? checkIn;
  final String? checkOut;
  final int? stars;
  final List<String>? stayImages;
  final String? amenities;
  final List<RoomEntity>? rooms;
}

abstract class RoomEntity {
  RoomEntity({
    this.roomNumber,
    this.roomCapacity,
    this.roomTypeName,
    this.stayName,
    this.guests,
  });
  final String? roomNumber;
  final int? roomCapacity;
  final String? roomTypeName;
  final String? stayName;
  final List<TicketUserEntity>? guests;
}

abstract class TicketUserEntity {
  TicketUserEntity({
    this.firstName,
    this.lastName,
    this.avatar,
    this.isUser,
  });
  final String? firstName;
  final String? lastName;
  final String? avatar;
  final bool? isUser;
}

abstract class UserTicketEntity {
  UserTicketEntity({
    this.ticketId,
    this.seat,
    this.ticketSystemId,
    this.ticketTypeName,
    this.ticketUserData,
    this.gate,
  });
  final int? ticketId;
  final String? seat;
  final String? ticketSystemId;
  final String? ticketTypeName;
  final TicketUserEntity? ticketUserData;
  final String? gate;
}
