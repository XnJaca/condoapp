import 'package:flutter/material.dart';

class AccountStatePage extends StatelessWidget {
  static const name = 'AccountStatePage';
  const AccountStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estado de Cuenta',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 121, 121),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 80,
      ),
      body: const Center(
        child: Text("Estado de Cuenta"),
      ),
    );
  }
}
