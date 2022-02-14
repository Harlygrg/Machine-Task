import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:machine_task/Controllers/home_controller.dart';

import 'package:machine_task/Services/api_service.dart';

import 'home_page.dart';

HomeController newController = Get.find();

class FullScreenImage extends StatelessWidget {
  const FullScreenImage(this.networkImage, {Key? key}) : super(key: key);
  final String networkImage;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: _size.width,
          height: _size.height,
          child: Stack(
            children: [
              SizedBox(
                  width: _size.width,
                  height: _size.height,
                  child: Image.network(
                    networkImage
                    //networkImage!
                    ,
                    fit: BoxFit.contain,
                  )),
              Positioned(
                  bottom: 100.h,
                  right: 50.w,
                  child: Card(
                    elevation: 5,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close_outlined,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Get.offAll(() => Home2());
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
