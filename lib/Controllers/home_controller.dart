import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_task/Services/api_service.dart';

class HomeController extends GetxController {
  TextEditingController serchController = TextEditingController();

  String? searchedValue;

//GlobalKey<FormState> formkey =GlobalKey<FormState>();

  //api calling function

  API_Manager apimanager() {
    API_Manager apiResult = API_Manager(searchedValue);
    return apiResult;
  }

//implementing lazy loading============================================================================

  ScrollController scrollController = ScrollController();
  bool isloading = true;
  int listLength = 8;
  List datas = [];
  List showData = [];
  int currentMax = 8;

  showdataFn() async {
    currentMax = 8;
    if (datas.length < 8) {
      showData.clear();
      showData.addAll(datas);
    } else {
      showData.clear();
      for (int i = 0; i < 8; i++) {
        showData.add(datas[i]);
      }
    }
  }

  apidatas() async {
    await API_Manager(searchedValue).getData();
  }

  addToDataList() {
    apidatas().then((value) {
      datas.add(value);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreData();
      }
    });
    super.onInit();
  }

  getMoreData() {
    if (currentMax < datas.length) {
      isloading = true;
      for (int i = currentMax; i <= currentMax + 1; i++) {
        // Future.delayed(Duration(microseconds: 50)).then((value) {
        showData.add(datas[i]);
        // });
      }
      update();
      isloading = false;
    } else {
      Get.snackbar("Limit Reached  ", "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.lightBlue[200]);
    }
    currentMax = currentMax + 2;
    update();
  }
}
