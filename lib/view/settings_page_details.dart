import 'package:flutter/material.dart';

import 'helper_widget/custom_app_bar.dart';


class SettingsDetailScreen extends StatelessWidget {
  const SettingsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Setting Detail Screen',automaticallyImplyLeading: true,),
      body: Center(child: Text('Setting Detail Screen')),
    );
  }
}