import 'package:flutter/material.dart';

import '../../../BackEnd/Navigation/navigation.dart';
import 'logic.dart';

///Need MORE...
///1. NEED TO ADD MORE COMPONENTS IN THE HOMEPAGE TO LOOK ALIKE ZERODHA HOMEPAGE..






class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF000000),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Add a back button and the logo of Zerodha...
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Back button
                          IconButton(
                            onPressed: () {
                              NavigationServices().navigateAndRemoveUntil('/');
                              signOut();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          //Zerodha Logo......
                          Image.asset('assets/zerodha-kite-logo.png',
                            width: 50,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    
                      Padding(
                      padding: EdgeInsets.symmetric(horizontal: 26),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               Text(
                                'Home',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
