import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noor/features/navigation/logic/navigation_cubit.dart';
import 'package:noor/features/navigation/logic/navigation_state.dart';

class NotificatiosButton extends StatefulWidget {
  const NotificatiosButton({super.key});

  @override
  State<NotificatiosButton> createState() => _NotificatiosButtonState();
}

class _NotificatiosButtonState extends State<NotificatiosButton> {
  bool notificationsState = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      buildWhen: (previous, current) => current is NotificationsState,
      builder: (context, state) {
        if (state is NotificationsState) {
          notificationsState = state.notificationsState;
        }
        return IconButton(
          onPressed: () {
            notificationsState = !notificationsState;
            context.read<NavigationCubit>().saveNotificationsState(
              notificationsState,
            );
          },
          icon: Icon(
            notificationsState ? Icons.notifications : Icons.notifications_off,
            color: Colors.white,
            size: 26,
          ),
        );
      },
    );
  }
}
