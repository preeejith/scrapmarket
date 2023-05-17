import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrap_market/models/commonbloc.dart';
import 'package:scrap_market/prefmanager/prefmanager.dart';
import 'package:scrap_market/repositories/repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String? dsvm;
  LoginBloc() : super(LoginState()) {
    on<GetLoginEvent>(_getLoginEvent);
    on<GetLogoutEvent>(_getLogoutEvent);
  }
  Future<FutureOr<void>> _getLoginEvent(
      GetLoginEvent event, Emitter<LoginState> emit) async {
    emit(Requesting());
    CommonModel loginModel = CommonModel();
    Map data = {
      "phone": event.phone,
      "password": event.password,
    };
    var url = '/user/login';
    loginModel = await Repository().checkPhoneNumber(url: url, data: data);
    if (loginModel.status == true) {
      // await PrefManager.setIsLoggedIn(true);
      // await PrefManager.setToken(loginModel.token.toString());
      // await PrefManager.setRole(loginModel.role.toString());
      // await PrefManager.setUserId(loginModel.id.toString());
      // if (loginModel.role == "Admin") {
      //   emit(AdminLoginSuccess(loginModel: loginModel));
      // } else if (loginModel.role == "Client") {
      //   emit(ClientLoginSuccess(loginModel: loginModel));
      // } else if (loginModel.role == "Worker") {
      //   emit(EmployeeLoginSuccess(loginModel: loginModel));
      // } else {}
    } else {
      emit(LoginError(error: loginModel.msg.toString()));
    }
  }

  Future<FutureOr<void>> _getLogoutEvent(
      GetLogoutEvent event, Emitter<LoginState> emit) async {
    emit(Loggingout());
    CommonModel commonModel;
    var devicetoken = await PrefManager.getDeviceToken();

    var url = '/user/logout?deviceToken=$devicetoken';
    commonModel = await Repository().employeeprofile(
      url: url,
    );
    if (commonModel.status == true) {
      emit(LogoutSuccess(commonModel: commonModel));
    } else {
      emit(LogoutError(error: commonModel.msg.toString()));
    }
  }
}

//events
class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLoginEvent extends LoginEvent {
  final String? password, count;
  final String? phone;
  GetLoginEvent({this.count, this.password, this.phone});
}

class GetLogoutEvent extends LoginEvent {
  final String? password, count;
  final String? phone;
  GetLogoutEvent({this.count, this.password, this.phone});
}

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Requesting extends LoginState {}

class Loggingout extends LoginState {}

class LoginSuccess extends LoginState {
  final CommonModel loginModel;
  LoginSuccess({required this.loginModel});
}

class AdminLoginSuccess extends LoginState {
  final CommonModel loginModel;
  AdminLoginSuccess({required this.loginModel});
}

class LogoutSuccess extends LoginState {
  final CommonModel commonModel;
  LogoutSuccess({required this.commonModel});
}

class EmployeeLoginSuccess extends LoginState {
  final CommonModel loginModel;
  EmployeeLoginSuccess({required this.loginModel});
}

class ClientLoginSuccess extends LoginState {
  final CommonModel loginModel;
  ClientLoginSuccess({required this.loginModel});
}

class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}

class LogoutError extends LoginState {
  final String error;
  LogoutError({required this.error});
}

class AddUserContactMatchList extends LoginState {
  final CommonModel loginModel;
  AddUserContactMatchList({required this.loginModel});
}
