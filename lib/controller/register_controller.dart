import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/viwes/main_screen.dart';

class RegisterController extends GetxController {
  final emailTextEditingController = TextEditingController();
  final activeCodeTextEditingController = TextEditingController();
  var email = '';
  var userId = '';

  rigestering() async {
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

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activeCodeTextEditingController.text,
      'command': 'verify'
    };
    var response = await DioServices().postMethod(map, ApiCastant.postRigester);
    if (response.data['response'] == 'verified') {
      var box = GetStorage();
      box.write('token', response.data["token"]);
      box.write('userId', response.data['user_id']);
      //print('token is :${box.read('token')}');
      //print('userId is : ${box.read('userId')}');
      Get.to(()=>MainScreen());
    } else {
      log('eroer' as num);
    }
    //print(response.data);
  }
}
