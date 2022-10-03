import 'package:add_user_flutter/pages/all_user_page.dart';
import 'package:add_user_flutter/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Set app provider
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MaterialApp(
        title: 'Add User',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: AllUser(),
      ),
    );
  }
}
