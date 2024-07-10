import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper_widget/custom_app_bar.dart';


class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Home Screen Screen',automaticallyImplyLeading: true,),
      body: Center(child: Text('Home Detail Screen')),
    );
  }
}
