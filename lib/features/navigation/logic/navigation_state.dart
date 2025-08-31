import 'package:noor/core/database/cities/cities_database.dart';

abstract class NavigationState {}


 class NavigationInitial extends NavigationState {}

class CityLoaded extends NavigationState {
  final City city;
  CityLoaded({required this.city});
}


class NotificationsState extends NavigationState {
  final bool notificationsState;
  NotificationsState({required this.notificationsState});
}
