import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:machine_task/Controllers/home_controller.dart';

HomeController getController = Get.find();

elevatedButton(){
  return  SizedBox(
    width: 300.w,
    child: ElevatedButton(
      onPressed: (){
         getController.searchedValue = getController.serchController.text;
        // getController.api_manager(searchKey: getController.searchedValue);
        getController.update();
      }, child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text("Search Image",style: TextStyle(fontSize: 15.sp,color: Colors.black),),
    ),
      style: ElevatedButton.styleFrom(
          primary: Colors.blue[200],
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

    ),
  );
}