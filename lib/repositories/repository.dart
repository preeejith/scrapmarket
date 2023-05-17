// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

import 'package:connectivity/connectivity.dart';
import 'package:scrap_market/models/commonbloc.dart';
import 'package:scrap_market/server/webclient.dart';

class Repository {
  Future<CommonModel> checkPhoneNumber(
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

  Future<CommonModel> employeeprofile({required String url}) async {
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
}
