import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});
  static String name = 'admin_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Placeholder(),
        ),
      ),
    );
  }
}