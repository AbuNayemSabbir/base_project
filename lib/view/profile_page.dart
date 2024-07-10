import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_base_project/controller/user_controller.dart';
import 'package:flutter_base_project/services/base_api_services.dart';
import 'package:flutter_base_project/view/helper_widget/custom_app_bar.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserController userController = Get.put(UserController(BaseApiService()));


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profile Screen',
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (userController.userList.isEmpty) {
          return const Center(child: Text('No users found.'));
        } else {
          return ListView.builder(
            itemCount: userController.userList.length,
            itemBuilder: (context, index) {
              final user = userController.userList[index];
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    onTap: () {
                      // Handle user tap
                    },
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
