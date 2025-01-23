abstract class CubitState {}

class InitCubit extends  CubitState {}

class LoadingCubit extends CubitState {}

class ErrorCubit extends CubitState {
  final String error;
  ErrorCubit(this.error);
}