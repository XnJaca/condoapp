import 'package:condo_app/config/theme/app_theme.dart';
import 'package:condo_app/screens/visitors/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisitorRecordsPage extends ConsumerWidget {
  static const name = 'VisitorRecordsPage';
  const VisitorRecordsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Visitas',
          style: TextStyle(color: AppTheme.primaryLight),
        ),
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormVisit(),
              SizedBox(height: 20),
              const Text(
                'Registro de visitas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              VisitorsList(),
            ],
          ),
        ),
      ),
    );
  }
}
