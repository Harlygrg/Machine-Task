import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:machine_task/Controllers/home_controller.dart';

HomeController controller = Get.find();

class API_Manager extends GetxController {

  String? onSearched;
  API_Manager(this.onSearched);

  apiString() {
    String searchString =
        "https://pixabay.com/api/?key=25663025-e3c8d1d46053c03960e98079e&q=$onSearched&image_type=photo";
    return searchString;
  }

  final dio = Dio();

  getData() async {


    try {
      final response = await dio.get(apiString());

      switch (response.statusCode) {
        case 200:
      List lst = [];
          for (int i = 0; i < response.data["hits"].length; i++) {
            lst.add(response.data["hits"][i]);
          }

          controller.datas.clear();
          controller.datas.addAll(lst);
          controller.showdataFn();
          controller.update();
          break;
          case 429 :
            Get.snackbar("Limit exceeded  ", "",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.lightBlue);
          break;
        default:
          Get.snackbar("Something went wrong ", "",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.lightBlue);
      }
    // }on SocketException catch (e){
    //   Get.snackbar("Something went wrong  ", "Check Internet connection",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.lightBlue[200]);
    // }on HttpException catch (e){
    //   Get.snackbar("Network error ", "Please try after some time.",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.lightBlue[200]);
    //
    }
    on DioError catch(e){
      print("-------------${e.response}");
      Get.snackbar("Please check your internet connection ", "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.lightBlue[200]);
    }

  }
}
