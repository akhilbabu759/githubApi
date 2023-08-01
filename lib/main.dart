import 'package:flutter/material.dart';
import 'package:github_api/home/controller/controller.dart';
import 'package:github_api/home/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
        ChangeNotifierProvider<CounterProvider1>(create: (_) => CounterProvider1()),
        
      ],
      
    child: const MaterialApp(debugShowCheckedModeBanner: false,
      home: Home(),
    ));
  }
}