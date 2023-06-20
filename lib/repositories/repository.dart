// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

import 'package:connectivity/connectivity.dart';
import 'package:scrap_market/models/commonbloc.dart';
import 'package:scrap_market/models/loginmodel.dart';
import 'package:scrap_market/server/webclient.dart';

class Repository {
  Future<LoginModel> checkPhoneNumber(
      {required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final LoginModel userModel = LoginModel.fromJson(response);
    return userModel;
  }
  Future<CommonModel> sellproduct(
      {required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final CommonModel userModel = CommonModel.fromJson(response);
    return userModel;
  }


  Future<CommonModel> productlist({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final CommonModel employeeProfileModel = CommonModel.fromJson(response);
    return employeeProfileModel;
  }

  Future<CommonModel> userreg({required String url ,dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url,data);
    final CommonModel employeeProfileModel = CommonModel.fromJson(response);
    return employeeProfileModel;
  }
}
