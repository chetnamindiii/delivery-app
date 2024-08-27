import 'package:flutter/material.dart';
import 'package:mextest/screens/login.dart';
import 'package:mextest/screens/shopping.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 113, 154),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Logo at the top center with background color
          Container(
            width: double.infinity,
            color: Color(0xFF1A9EB7),
            padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
            child: Image.asset(
              'assets/images/new.png',
              height: 400,
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Centered "Online Payment" text
                const Text(
                  'ONLINE PAYMENT',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Skip>>',
                      style: TextStyle(fontSize: 25, color: Colors.orange),
                    ),
                    SizedBox(width: 200),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoppingScreen()));
                      },
                      //SizedBox(width: 200),
                      child: Image.asset(
                        'assets/images/next-arrow@3x.png',
                        height: 57,
                      ),
                    ),
                  ],
                ),
                // SizedBox(width: 200),
                // Image.asset(
                //   'assets/images/next-arrow@3x.png',
                //   height: 57,
                // ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
