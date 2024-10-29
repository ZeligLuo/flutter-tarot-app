import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarot_app/core/network_manager.dart';
import 'package:tarot_app/data/source/firebase/firebase_datasource.dart';
import 'package:tarot_app/core/app_navigate/routes.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => NetworkManager()
          ),
          RepositoryProvider(
             create: (context) => FirebaseDataSource()
          ),
        ],
        child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = AppNavigator.onGenerateRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'CircularStd'
      ),
    );
  }
}