import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:machine_task/Controllers/home_controller.dart';
import 'package:machine_task/Screens/image_fullscreen.dart';

HomeController controller = Get.find();

gridContainer({required String image,required String index, var dat}){
  return GestureDetector(
    onTap: (){

      Get.to(()=>FullScreenImage(image,));
    },
    child: Container(
      margin:const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
        image: DecorationImage(image:NetworkImage(image,),fit: BoxFit.fill )

      ),
      child: Text(index,style: TextStyle(color: Colors.white,fontSize: 20),),

    ),
  );
}