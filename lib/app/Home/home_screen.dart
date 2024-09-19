import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moto_app/app/Info/info_screen.dart';
import 'package:http/http.dart' as http; // Импортируем пакет http
import 'dart:convert'; // Импортируем пакет для работы с JSON

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>(); // Ключ для формы
  final _makeController = TextEditingController(); // Контроллер для поля "Make"
  final _modelController = TextEditingController(); // Контроллер для поля "Model"
  final _cubController = TextEditingController();

  // Переменная для хранения данных из API
  Map<String, dynamic>? apiData; 

  @override
  void dispose() {
    _makeController.dispose();
    _modelController.dispose();
    _cubController.dispose();
    super.dispose();
  }

  // Функция для отправки API запроса
  Future<void> _sendApiRequest() async {
    final make = _makeController.text;
    final model = _modelController.text;
    final cub = _cubController.text;

    if (_formKey.currentState!.validate()) {
      // Замените 'your_api_key' на ваш реальный ключ API
      const apiKey = '02b95ecb4bmsh7f31cfbbef4a610p10c7a5jsn30d2253d1fcf'; 
      final uri = Uri.parse(
        'https://your-api-endpoint.com/search?make=$make&model=$model $cub');

      // Выводим запрос в консоль
      print('Отправка запроса: ${uri.toString()}');

      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $apiKey',
        },
      );

      if (response.statusCode == 200) {
        // Успешный ответ от API
        setState(() {
          apiData = jsonDecode(response.body); // Декодируем JSON
          //context.push('/info_screen'); // Переход на страницу информации 
        });
      } else {
        // Ошибка при получении данных
        print('Error: ${response.statusCode}');
        // Выведите сообщение об ошибке пользователю
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 50, 88),
          title: const Text('Info screen'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _makeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Make',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите марку';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _modelController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Model',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите модель';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _cubController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cub',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _sendApiRequest, // Вызываем функцию для отправки запроса

                child: const Text('Send'),
              ),
              ElevatedButton(
                 onPressed: () 
              {
                context.push('/info_screen'); 
              }, // Вызываем функцию для отправки запроса

                child: const Text('Info page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



