import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  @override
  Widget build(BuildContext context) {
    final defautpinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    final focusedPinTheme = defautpinTheme.copyDecorationWith(
      border: Border.all(
        color: const Color.fromRGBO(114, 178, 238, 1),
      ),
    );

    final submittedPinTheme = defautpinTheme.copyWith(
      decoration: defautpinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 234, 1),
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img2.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 25),
              const Text(
                "OTP Verificaion",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "We need tp register your phone without getting started!!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              const SizedBox(height: 30),
              const Text(
                "Don't Get OTP?  Rsend",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Verify",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // Row(
              //   children: [
              //     TextButton(
              //         onPressed: () {
              //           Navigator.pushNamedAndRemoveUntil(
              //             context,
              //             'phone',
              //             (route) => false,
              //           );
              //         },
              //         child: Text(
              //           "Edit Phone Number ?",
              //           style: TextStyle(color: Colors.black),
              //         ))
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
