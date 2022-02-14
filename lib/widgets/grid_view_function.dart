import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:machine_task/Controllers/home_controller.dart';

import 'grid_container.dart';

HomeController controller = Get.find();

gridVewFn() {
  if (controller.showData.isEmpty) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  } else {
    return GridView.builder(
        itemCount: controller.showData.length,
        //homeController.showData.length,
        // homeController.showCount,
        controller: controller.scrollController,
        //semanticChildCount: 5,
        cacheExtent: 0,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.w,
          mainAxisSpacing: 5.h,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (BuildContext context, index) {
          return gridContainer(
              image: "${controller.showData[index]["largeImageURL"]}",
              index: index.toString());
        });
  }
}
