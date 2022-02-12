import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:machine_task/Controllers/home_controller.dart';
import 'package:machine_task/api_model/api_model.dart';
import 'package:machine_task/widgets/button.dart';
import 'package:machine_task/widgets/divider.dart';
import 'package:machine_task/widgets/grid_container.dart';
import 'package:machine_task/widgets/serch_form_field.dart';
class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size= MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
    init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding:EdgeInsets.only(left: 5.w,right: 5.w),
            child: SingleChildScrollView(
              child: SizedBox(
                width:_size.width ,
                height:_size.height,
                child: Column(
                  children: [
                            divider(height: 100.h),
                          searchTextFormField(),
                    divider(height: 20.h),
                          elevatedButton(),
                    divider(height: 15.h),
                    Container(
                      height: 550.h,
                     // width: 300.w,
                      //color: Colors.blue[200],
                      child: controller.serchController.text.isEmpty?
                         const Center(child: Text(" No values to display"),):
                      FutureBuilder<ImageDisplayModel?>(
                        future: controller.apimanager().searchFinder(),
                        builder: (context,snapshot) {
                         // print("************** ${controller.searchedValue}");
                          if(!snapshot.hasData){
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return GridView.builder(
                            itemCount: snapshot.data!.hits!.length,
                            scrollDirection: Axis.vertical,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5.w,
                                  mainAxisSpacing: 5.h,
                                childAspectRatio: 3/2,

                              ),
                              itemBuilder: (BuildContext context,index){
                              var data=snapshot.data!.hits![index];
                              return gridContainer(image: "${data.largeImageUrl}");
                              });
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
