import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moto_app/app/Home/home_screen.dart';

void main() {
  runApp(const InfoScreen());
}

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(    
            backgroundColor: const Color.fromARGB(255, 2, 50, 88), 
            title: const Text('Info screen'),  ),
        body: Column(
          children: [
            const Align(
              alignment: Alignment.center,
            child: Text('Info about model'),
            ),
            const Text('Марка:'),
            const Text('Модель:'),
            const Text('Кубатура:'),
            const Text('Сцепление:'),
            ElevatedButton(
              onPressed: () 
              {
                context.push('/'); 
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

