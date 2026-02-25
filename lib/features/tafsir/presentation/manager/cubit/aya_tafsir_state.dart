part of 'aya_tafsir_cubit.dart';

@immutable
sealed class AyaTafsirState {}

final class AyaTafsirInitial extends AyaTafsirState {}

final class AyaTafsirLoading extends AyaTafsirState {}

final class AyaTafsirSuccess extends AyaTafsirState {
  final AyaTafsir data;
  AyaTafsirSuccess({required this.data});
}

final class AyaTafsirError extends AyaTafsirState {
  final String failure;
  AyaTafsirError({required this.failure});
}
