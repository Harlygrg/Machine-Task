
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:machine_task/Controllers/home_controller.dart';
import 'package:machine_task/api_model/api_model.dart';
import 'package:http/http.dart' as http;

HomeController controller = Get.find();
class API_Manager{

  String ?onSearched;
  API_Manager(this.onSearched);

  apiString(){
    print("=============oooo--$onSearched");
    String searchString = "https://pixabay.com/api/?key=25663025-e3c8d1d46053c03960e98079e&q=$onSearched&image_type=photo";
    print(searchString);
    return searchString;
  }
  Future<ImageDisplayModel?> searchFinder()async{
    print("======****=======$onSearched");
    print("=============future working");
    var apiResponse = await http.get(Uri.parse(apiString()));
    print("=============RESPONSE WORKING");

      if(apiResponse.statusCode==200){
        print("***************** SUCCESS RESPONSE");
        var responseBody = apiResponse.body;
        final value = jsonDecode(responseBody);
        var result = ImageDisplayModel.fromJson(value);
        return result;
      }
    else{
      print("***************** Failed to load movies image");
      throw Exception("Failed to load movies image");
    }
    }

  }
Future<ImageDisplayModel?> searchFinder()async{
  //print("======****=======$onSearched");
  print("=============future working");
  var apiResponse = await http.get(Uri.parse("https://pixabay.com/api/?key=25663025-e3c8d1d46053c03960e98079e&q=book&image_type=photo"));
  print("=============RESPONSE WORKING");

  if(apiResponse.statusCode==200){
    print("***************** SUCCESS RESPONSE");
    var responseBody = apiResponse.body;
    final value = jsonDecode(responseBody);
    var result = ImageDisplayModel.fromJson(value);
    return result;
  }
  else{
    print("***************** Failed to load movies image");
    throw Exception("Failed to load movies image");
  }
}