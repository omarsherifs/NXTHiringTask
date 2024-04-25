import 'package:flutter/material.dart';
import 'package:nxthiringtask/features/main_user_screen/domain/entities/user_reservation_entity.dart';
import 'package:nxthiringtask/features/main_user_screen/presentation/widgets/user_ticket_widget.dart';

class TicketBottomSheet extends StatelessWidget {
  const TicketBottomSheet({
    required this.ticketUserData,
    super.key,
  });
  final UserTicketEntity? ticketUserData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
        ),
        UserTicketWidget(ticketUserData: ticketUserData),
      ],
    );
  }
}
