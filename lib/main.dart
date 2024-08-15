import 'package:flutter/material.dart';
import 'package:totalx_task/screens/otp_verification_page.dart';
import 'package:totalx_task/screens/phon_verify_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'phone',
      routes: {
        'phone': (context) => PhonVerifyPage(),
        'verify': (context) => OtpVerificationPage()
      },
    );
  }
}
