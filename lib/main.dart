import 'package:flutter/material.dart';
import 'features/random_number/presentation/pages/random_number_page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Number Trivia',
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.red,
      ),
      home: RandomNumberPage(),
    );
  }
}