part of 'tafsir_cubit.dart';

@immutable
sealed class TafsirState {}

final class TafsirInitial extends TafsirState {}

final class TafsirLoading extends TafsirState {}

final class TafsirSuccess extends TafsirState {
  final List<Tafsir> data;
  TafsirSuccess({required this.data});
}

final class TafsirError extends TafsirState {
  final String failure;
  TafsirError({required this.failure});
}
