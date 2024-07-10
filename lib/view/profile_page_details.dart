import 'package:flutter/material.dart';

import 'helper_widget/custom_app_bar.dart';


class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Profile Detail Screen',automaticallyImplyLeading: true,),
      body: Center(child: Text('Profile Detail Screen')),
    );
  }
}