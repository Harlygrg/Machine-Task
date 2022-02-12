import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

gridContainer({required String image}){
  return GestureDetector(
    onTap: (){
    },
    child: Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
        image: DecorationImage(image:NetworkImage(image,),fit: BoxFit.fill )

      ),

    ),
  );
}