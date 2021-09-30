import 'package:flutter/material.dart';
import 'package:my_contacts/screens/dashboard.dart';

void main() {
  runApp(const MyContacts());
}

class MyContacts extends StatelessWidget {
  const MyContacts({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
        ).copyWith(scaffoldBackgroundColor: const Color(0xFF98A7Af)),
        home: const Dashboard());
  }
}
