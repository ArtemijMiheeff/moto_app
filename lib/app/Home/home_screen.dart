import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moto_app/app/Info/info_screen.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(    
            backgroundColor: const Color.fromARGB(255, 2, 50, 88), 
            title: const Text('Info screen'),  ),
        body: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Make',
              ),
            ),
                        const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Model',
              ),
            ),
            ElevatedButton(
              onPressed: () 
              {
                context.push('/info_screen'); 
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}

