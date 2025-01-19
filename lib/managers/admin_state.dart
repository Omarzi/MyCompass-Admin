part of 'admin_cubit.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

/// Login
final class AdminLoginLoading extends AdminState {}
final class AdminLoginSuccess extends AdminState {
  final String? message;

  AdminLoginSuccess({this.message});
}
final class AdminLoginFailure extends AdminState {
  final ErrorModel errorModel;

  AdminLoginFailure({required this.errorModel});
}

/// Get All Admins
final class GetAllAdminsLoading extends AdminState {}

final class GetAllAdminsSuccess extends AdminState {
  final GetAllAdminsDataModel getAllAdminsDataModel;

  GetAllAdminsSuccess(this.getAllAdminsDataModel);
}

final class GetAllAdminsFailure extends AdminState {
  final ErrorModel errorModel;

  GetAllAdminsFailure({required this.errorModel});
}