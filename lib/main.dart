import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'screens/phon_verify_page.dart';
import 'screens/otp_verification_page.dart';
import 'providers/user_provider.dart';
import 'view/add_user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'phone',
        routes: {
          'phone': (context) => const PhonVerifyPage(),
          'verify': (context) => const OtpVerificationPage(),
          'home': (context) => const HomePage(),
          'adduser': (context) => AddUserDialog(
                onSave: (user) {
                  Provider.of<UserProvider>(context, listen: false)
                      .addUser(user);
                },
              ),
        },
      ),
    );
  }
}
