// import 'package:flutter/material.dart';
// import 'package:mextest/screens/signup.dart';

// class VerificationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(20, 120, 20, 50),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             //    SizedBox(height: 20),
//             // Bold "Welcome Back!" text
//             Text(
//               'OTP verification',
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             // "Login to continue" text
//             Text(
//               'Login to continue',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 40),
//             // Phone Number TextField
//             TextField(
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 labelText: 'Phone Number',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               ),
//             ),
//             SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 child: const Text(
//                   'Get OTP',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF1A9EB7),
//                   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//             // "or continue with" text
//             Text(
//               'or continue with',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/images/fb.png', // Replace with your Facebook icon asset path
//                   width: 150,
//                   height: 150,
//                 ),
//                 const SizedBox(width: 30),
//                 Image.asset(
//                   'assets/images/google.png', // Replace with your Google icon asset path
//                   width: 150,
//                   height: 150,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignupScreen()),
//                 );
//               },
//               child: const Text(
//                 "Don't have an account? / Sign up",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mextest/screens/signup.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool invalidOtp = false;
  int resendTime = 60;
  late Timer countdownTimer;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        countdownTimer.cancel();
      }
    });
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  String strFormatting(n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                        height: 60), // Adjust this space for the back button
                    const Text(
                      'OTP Verification',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Enter the verification code we just sent on your number',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center, // Center align the text
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myInputBox(context, txt1),
                        myInputBox(context, txt2),
                        myInputBox(context, txt3),
                        myInputBox(context, txt4),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Haven't received OTP yet?",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        resendTime == 0
                            ? InkWell(
                                onTap: () {
                                  // Resend OTP Code
                                  setState(() {
                                    invalidOtp = false;
                                    resendTime = 60;
                                  });
                                  startTimer();
                                },
                                child: const Text(
                                  'Resend',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                    const SizedBox(height: 10),
                    resendTime != 0
                        ? Text(
                            'You can resend OTP after ${strFormatting(resendTime)} second(s)',
                            style: const TextStyle(fontSize: 18),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 5),
                    Text(
                      invalidOtp ? 'Invalid otp!' : '',
                      style: const TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        final otp =
                            txt1.text + txt2.text + txt3.text + txt4.text;
                        if (otp == '1989') {
                          // Go to welcome
                          stopTimer();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        } else {
                          setState(() {
                            invalidOtp = true;
                          });
                        }
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: Center(
                          child: const Text(
                            'VERIFY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1A9EB7),
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Back button
          Positioned(
            top: 40, // Position from top
            left: 16, // Position from left
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Image.asset(
                'assets/images/left.png', // Arrow icon asset path
                width: 24, // Adjust width as needed
                height: 24, // Adjust height as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget myInputBox(BuildContext context, TextEditingController controller) {
  return Container(
    height: 70,
    width: 60,
    decoration: BoxDecoration(
      border: Border.all(width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: TextField(
      controller: controller,
      maxLength: 1,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 42),
      decoration: const InputDecoration(
        counterText: '',
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}
