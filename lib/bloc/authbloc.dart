import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scrap_market/models/commonbloc.dart';
import 'package:scrap_market/models/loginmodel.dart';
import 'package:scrap_market/prefmanager/prefmanager.dart';
import 'package:scrap_market/repositories/repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String? dsvm;
  LoginBloc() : super(LoginState()) {
    on<GetLoginEvent>(_getLoginEvent);

    on<GetUserRegistrationEvent>(_getUserRegistrationEvent);
    // on<GetLogoutEvent>(_getLogoutEvent);

    on<GetSellEvent>(_getSellEvent);
    on<GetProductListEvent>(_getProductListEvent);
  }
  Future<FutureOr<void>> _getLoginEvent(
      GetLoginEvent event, Emitter<LoginState> emit) async {
    emit(Requesting());
    LoginModel loginModel;
    Map data = {
      "userName": event.email,
      "password": event.password,
    };
    var url = '/login';
    loginModel = await Repository().checkPhoneNumber(url: url, data: data);
    if (loginModel.status == true) {
      await PrefManager.setToken(loginModel.token);
      await PrefManager.setRole(loginModel.role);
      await PrefManager.setUserId(loginModel.userName);
      emit(LoginSuccess(loginModel: loginModel));
    } else {
      emit(LoginError(error: loginModel.msg.toString()));
    }
  }

  Future<FutureOr<void>> _getUserRegistrationEvent(
      GetUserRegistrationEvent event, Emitter<LoginState> emit) async {
    String url;
    emit(UserRegistering());
    CommonModel commonModel = CommonModel();
    Map data = {
      "name": event.name,
      "phone": event.phone,
      "email": event.email,
      "password": event.password,
      "district": event.district,
      "town": event.town,
      "street": event.street,
      "buildingNo": event.buildingNo,
      "houseNo": event.houseNo,
      "landmark": event.landmark,
      "pincode": event.pincode,
      "place": event.town,
      "orgaisation": event.orgaisation
    };
    event.isuser == true
        ? url = '/user/registration'
        : url = '/buyer/registration';
    commonModel = await Repository().userreg(url: url, data: data);
    if (commonModel.status == true) {
      emit(RegUserSucces(error: commonModel.msg.toString()));
    } else {
      Fluttertoast.showToast(msg: commonModel.msg.toString());
      emit(UserRegError(error: commonModel.msg.toString()));
    }
  }

  // Future<FutureOr<void>> _getLogoutEvent(
  //     GetLogoutEvent event, Emitter<LoginState> emit) async {
  //   emit(Loggingout());
  //   CommonModel commonModel;
  //   var devicetoken = await PrefManager.getDeviceToken();

  //   var url = '/user/logout?deviceToken=$devicetoken';
  //   commonModel = await Repository().employeeprofile(
  //     url: url,
  //   );
  //   if (commonModel.status == true) {
  //     emit(LogoutSuccess(commonModel: commonModel));
  //   } else {
  //     emit(LogoutError(error: commonModel.msg.toString()));
  //   }
  // }

  Future<FutureOr<void>> _getSellEvent(
      GetSellEvent event, Emitter<LoginState> emit) async {
    emit(Selling());
    CommonModel commonModel;
    Map map = {
      "category": event.category,
      "quantity": event.quantity,
      "description": event.description
    };
    var url = '/seller/page';
    commonModel = await Repository().sellproduct(url: url, data: map);
    if (commonModel.status == true) {
      emit(SoldSuccess(commonModel: commonModel));
    } else {
      emit(SoldError(error: commonModel.msg.toString()));
    }
  }
}

Future<FutureOr<void>> _getProductListEvent(
    GetProductListEvent event, Emitter<LoginState> emit) async {
  emit(Selling());
  CommonModel commonModel;

  var url = '/buyer/view';
  commonModel = await Repository().productlist(url: url);
  if (commonModel.status == true) {
    emit(SoldSuccess(commonModel: commonModel));
  } else {
    emit(SoldError(error: commonModel.msg.toString()));
  }
}

//events
class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLoginEvent extends LoginEvent {
  final String? password;
  final String? email;
  GetLoginEvent({this.password, this.email});
}

class GetLogoutEvent extends LoginEvent {
  final String? password, count;
  final String? phone;
  GetLogoutEvent({this.count, this.password, this.phone});
}

class GetSellEvent extends LoginEvent {
  final String? category, quantity;
  final String? description;
  GetSellEvent({this.category, this.quantity, this.description});
}

class GetProductListEvent extends LoginEvent {
  final String? category, quantity;
  final String? description;
  GetProductListEvent({this.category, this.quantity, this.description});
}

class GetUserRegistrationEvent extends LoginEvent {
  final bool? isuser;
  final String? name, phone;
  final String? email,
      password,
      district,
      town,
      street,
      buildingNo,
      houseNo,
      landmark,
      pincode,
      place,
      orgaisation;
  GetUserRegistrationEvent({
    this.name,
    this.isuser,
    this.phone,
    this.orgaisation,
    this.email,
    this.password,
    this.district,
    this.town,
    this.street,
    this.buildingNo,
    this.houseNo,
    this.landmark,
    this.pincode,
    this.place,
  });
}

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Requesting extends LoginState {}

class UserRegistering extends LoginState {}

class Loggingout extends LoginState {}

class Selling extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;
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

class SoldSuccess extends LoginState {
  final CommonModel commonModel;
  SoldSuccess({required this.commonModel});
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

class UserRegError extends LoginState {
  final String error;
  UserRegError({required this.error});
}

class RegUserSucces extends LoginState {
  final String error;
  RegUserSucces({required this.error});
}

class LogoutError extends LoginState {
  final String error;
  LogoutError({required this.error});
}

class SoldError extends LoginState {
  final String error;
  SoldError({required this.error});
}

class AddUserContactMatchList extends LoginState {
  final CommonModel loginModel;
  AddUserContactMatchList({required this.loginModel});
}
