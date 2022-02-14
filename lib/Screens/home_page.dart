import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:machine_task/Controllers/home_controller.dart';
import 'package:machine_task/widgets/button.dart';
import 'package:machine_task/widgets/divider.dart';
import 'package:machine_task/widgets/grid_view_function.dart';
import 'package:machine_task/widgets/serch_form_field.dart';

class Home2 extends StatelessWidget {
  var homeController = Get.put(HomeController());

  Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SingleChildScrollView(
          child: SizedBox(
            width: _size.width,
            height: _size.height,
            child: Column(
              children: [
                divider(height: 80.h),
                searchTextFormField(),
                divider(height: 18.h),
                elevatedButton(),
                divider(height: 14.h),
                GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (controller) {
                      return SizedBox(
                        height: 540.h,
                        child: (homeController.searchedValue == null ||
                                homeController.isloading == true)
                            ? const Center(
                                child: Text("Search images to display"),
                              )
                            : gridVewFn(),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
