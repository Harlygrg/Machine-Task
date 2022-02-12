

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:machine_task/Services/api_service.dart';

class HomeController extends GetxController{

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }



String ?searchedValue;
TextEditingController serchController = TextEditingController();
final formkey =GlobalKey<FormState>();

API_Manager apimanager(){
  // print("-----------apiManagerFunctionInController-------------------$searchKey");
  API_Manager apiResult= API_Manager(searchedValue);
  return apiResult;
}



}