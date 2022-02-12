import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:machine_task/Controllers/home_controller.dart';
import 'package:machine_task/Screens/home2.dart';
import 'package:machine_task/Screens/home_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ()=>
          GetMaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context,widget){
              ScreenUtil.setContext(context);
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: widget!,);
            },
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home:
            //Home2(),
            HomePage(),

          ),
      designSize: Size(375, 812),
    );
  }
}
