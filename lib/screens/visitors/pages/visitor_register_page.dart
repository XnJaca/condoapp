import 'package:flutter/material.dart';

class VisitorRegisterPage extends StatelessWidget {
  static const name = 'VisitorRegisterPage';
  const VisitorRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterPage'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 80,
      ),
      body: const Center(
        child: Text('RegisterPage'),
      ),
    );
  }
}
