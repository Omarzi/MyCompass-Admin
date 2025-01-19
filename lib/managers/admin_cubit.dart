import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mycompass_admin_website/core/api_constants.dart';
import 'package:mycompass_admin_website/core/dio/dio_helper.dart';
import 'package:mycompass_admin_website/core/local_storage/cach_keys.dart';
import 'package:mycompass_admin_website/core/local_storage/cache_helper.dart';
import 'package:mycompass_admin_website/core/log_util.dart';
import 'package:mycompass_admin_website/models/auth/user_data_model.dart';
import 'package:mycompass_admin_website/models/error/error_model.dart';
import 'package:mycompass_admin_website/models/main/get_all_admins_data_model.dart';
export 'package:dio/dio.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  static AdminCubit of(context) => BlocProvider.of<AdminCubit>(context);

  DioHelper dioHelper = DioHelper();

  UserDataModel userDataModel = UserDataModel();
  GetAllAdminsDataModel getAllAdminsDataModel = GetAllAdminsDataModel();

  /// Login
  void login({
    required String email,
    required String password,
  }) async {
    emit(AdminLoginLoading());
    try {
      final response = await dioHelper.postData(
        endPoint: ApiConstants.loginUrl,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        userDataModel = UserDataModel.fromJson(response.data);

        await CacheHelper.putString(
          key: CacheKeys.token,
          value: userDataModel.authorization!.token ?? '',
        );
        await CacheHelper.putString(
          key: CacheKeys.email,
          value: userDataModel.result!.email ?? '',
        );
        logSuccess(
            'Login successful, email is ${CacheHelper.getString(key: CacheKeys.email)}');
        emit(AdminLoginSuccess(
          message: 'Reset code sent to email. Please verify the code.',
        ));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        final errorMessage =
            response.data['message']?.toString() ?? 'Unknown error';
        logError(errorMessage);
        emit(AdminLoginFailure(errorModel: ErrorModel(message: errorMessage)));
      } else {
        final errorMessage =
            response.data['message']?.toString() ?? 'Error in login';
        logError(errorMessage);
        emit(AdminLoginFailure(errorModel: ErrorModel(message: errorMessage)));
      }
    } catch (e) {
      logError(e.toString());
      emit(AdminLoginFailure(errorModel: ErrorModel(message: e.toString())));
    }
  }

}
