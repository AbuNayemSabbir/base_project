import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;
  var isLoading = false.obs;
  final GlobalKey<ScaffoldState> key = GlobalKey(); // Create a key

}

