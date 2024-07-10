import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_base_project/controller/nav_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final String title;
  final IconData? prefixIcon;
  final VoidCallback? onPrefixIconPressed;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.automaticallyImplyLeading = false,
    required this.title,
    this.prefixIcon,
    this.onPrefixIconPressed,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.find();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 2,
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(8),
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: Text(title),
        leading: prefixIcon != null
            ? IconButton(
          icon: Icon(prefixIcon),
          onPressed: onPrefixIconPressed,
        )
            : null,
        actions: actions ??
            [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  navController.key.currentState?.openDrawer();
                },
              ),
            ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
