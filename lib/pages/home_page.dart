import 'package:flutter/material.dart';
import 'package:social/component/custom_drawer.dart';
import 'package:social/component/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: 'H O M E',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onPrimary),
      ),
      drawer: CustomDrawer(),
    );
  }
}
