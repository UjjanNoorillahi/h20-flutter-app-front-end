import 'package:flutter/material.dart';
import 'package:h2o/provider/auth_token_provider.dart';
import 'package:h2o/screens/find_friends_screen.dart';
import 'package:h2o/screens/friends_suggestion_screen.dart';
import 'package:provider/provider.dart';

import 'package:h2o/screens/splash_screen.dart';

import 'Demo/compability_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthTokenProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CompatibilityScreen(),
      ),
    );
  }
}