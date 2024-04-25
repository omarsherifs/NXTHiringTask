import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nxthiringtask/features/main_user_screen/presentation/cubits/reservations_cubit.dart';
import 'package:nxthiringtask/features/main_user_screen/presentation/widgets/reservation_bottom_sheet.dart';
import 'package:nxthiringtask/features/main_user_screen/presentation/widgets/ticket_bottom_sheet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationsCubit(),
      child: BlocBuilder<ReservationsCubit, ReservationsState>(
        builder: (context, state) {
          return Scaffold(
            body: (state is ReservationsLoading)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (state is ReservationsError)
                    ? Center(
                        child: Text(state.errorMessage),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 40,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.apps),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Theme',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.sunny),
                                    Switch(
                                      value: AdaptiveTheme.of(context).mode.isDark,
                                      onChanged: (value) {
                                        if (value) {
                                          AdaptiveTheme.of(context).setDark();
                                        } else {
                                          AdaptiveTheme.of(context).setLight();
                                        }
                                      },
                                    ),
                                    const Icon(Icons.nightlight_round),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // ignore: inference_failure_on_function_invocation
                                    final reservationData =
                                        BlocProvider.of<ReservationsCubit>(context).userReservationEntity;

                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (_) {
                                        return DraggableScrollableSheet(
                                          expand: false,
                                          initialChildSize: 0.7,
                                          builder: (_, controller) {
                                            return ReservationBottomSheet(
                                              reservationData: reservationData,
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width * 0.85,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Open Reservation',
                                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).backgroundColor,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                InkWell(
                                  onTap: () {
                                    final reservationData =
                                        BlocProvider.of<ReservationsCubit>(context).userReservationEntity;

                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (_) {
                                        return DraggableScrollableSheet(
                                          expand: false,
                                          builder: (_, controller) {
                                            return TicketBottomSheet(
                                              ticketUserData: reservationData!.reservations!.first.userTickets!.first,
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width * 0.85,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 3,
                                        color: Theme.of(context).iconTheme.color!,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Show iOS Ticket',
                                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                TextButton(
                                  onPressed: () {
                                    final reservationData =
                                        BlocProvider.of<ReservationsCubit>(context).userReservationEntity;

                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (_) {
                                        return DraggableScrollableSheet(
                                          expand: false,
                                          builder: (_, controller) {
                                            return TicketBottomSheet(
                                              ticketUserData: reservationData!.reservations!.first.userTickets!.first,
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Show Android Ticket',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
          );
        },
      ),
    );
  }
}
