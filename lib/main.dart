import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app/Home/home_screen.dart';
import 'app/Info/info_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/', // Главная страница
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/info_screen', // Страница с деталями
            builder: (context, state) => const InfoScreen(
              //apiData: state.extra as Map<String, dynamic>,
            ),
          ),
          // Добавьте маршруты для других страниц
        ],
      ),
    ),
  );
}