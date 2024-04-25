import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:nxthiringtask/features/main_user_screen/domain/entities/user_reservation_entity.dart';
import 'package:ticket_widget/ticket_widget.dart';

class UserTicketWidget extends StatelessWidget {
  const UserTicketWidget({required this.ticketUserData, super.key});
  final UserTicketEntity? ticketUserData;

  @override
  Widget build(BuildContext context) {
    return TicketWidget(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 170,
      color: Theme.of(context).brightness == Brightness.dark ? Colors.grey[700]! : Colors.grey[200]!,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  ticketUserData?.ticketUserData?.avatar ?? '',
                ),
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Text(
                    '${ticketUserData?.ticketUserData?.firstName} ${ticketUserData?.ticketUserData?.lastName}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '#${ticketUserData?.ticketSystemId}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: DottedLine(
              dashColor: Colors.grey[400]!,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Ticket type: ${ticketUserData?.ticketTypeName}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Seat: Gate ${ticketUserData?.gate} / Seat ${ticketUserData?.seat}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
