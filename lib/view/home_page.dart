import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_base_project/controller/nav_controller.dart';
import 'package:flutter_base_project/routes/app_routes.dart';
import 'package:flutter_base_project/view/helper_widget/custom_app_bar.dart';
import 'package:flutter_base_project/view/helper_widget/custom_elevated_button.dart';

import 'helper_widget/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final NavController navController = Get.find();
  TextEditingController textEditingController =TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const CustomAppBar(title: 'Home Screen'),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                label: 'Email',
                controller: textEditingController,
                prefixIcon: Icons.email_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  } else if (!isValidEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },

              ),
              Obx( () {
                  return CustomElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        navController.isLoading.value = true;
                        Future.delayed(const Duration(seconds: 3), () {
                          navController.isLoading.value = false;
                          Get.toNamed(AppRoutes.homeDetail, id: 1);
                        });
                      }
                    },
                    text: 'Submit',
                    isLoading: navController.isLoading.value,
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email.trim());
  }
}