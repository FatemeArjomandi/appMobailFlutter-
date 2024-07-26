import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../component/api_constant.dart';
import '../component/storage_const.dart';
import '../services/dio_service.dart';
import '../viwes/main_screen.dart';
import '../viwes/register/register_into.dart';

class RegisterController extends GetxController {
  final emailTextEditingController = TextEditingController();
  final activeCodeTextEditingController = TextEditingController();
  var email = '';
  var userId = '';

  rigesteringEmail() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };
    var response = await DioServices().postMethod(map, ApiCastant.postRigester);
    if (response.statusCode == 200) {
      email = emailTextEditingController.text;
      userId = response.data["user_id"];
      //print(response);
    }
  }

  verifyCode() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activeCodeTextEditingController.text,
      'command': 'verify'
    };
    var response = await DioServices().postMethod(map, ApiCastant.postRigester);
    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(token, response.data["token"]);
        box.write(user_Id, response.data['user_id']);
        //print('token is :${box.read('token')}');
        //print('userId is : ${box.read('userId')}');
        Get.to(() => MainScreen());
        break;
      case 'incorrect_code':
        Get.snackbar('خطا', 'کد اشتباه هست');
        break;
      case ' expired':
        Get.snackbar('خطا', 'کد منقضی شده هست');
        break;
    }
  }

  togleLogin() {
    var box = GetStorage();

    if (box.read(token) == null) {
      Get.to(() => RegisterInto());
      debugPrint('token is null');
    } else {
      debugPrint('token is :${box.read(token)}');
    }
  }
}
