import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:machine_task/Controllers/home_controller.dart';

HomeController controller = Get.find();
searchTextFormField(){
  return Form(
    key: controller.formkey,
    child: Container(
      width: 300.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow:const [
           BoxShadow(
            color: Colors.grey,
            blurRadius: 6.0, // soften the shadow
            spreadRadius: .01, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              3.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon:Icon(
            Icons.search_outlined,
          ),

          labelStyle: TextStyle(
              fontSize: 14.sp,
          ),
          labelText:"Search",
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
        ),
        //controller: controller,
        autovalidateMode:AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        controller: controller.serchController,
      ),
    ),
  );}
