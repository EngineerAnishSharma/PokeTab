import 'package:flutter/material.dart';
import 'package:poke_app/main.dart';

import 'const/colors.dart';
import 'const/text_style.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Demo()));
    });
  }
  @override
  void initState() {
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 150,),
            Align(
              alignment: Alignment.center,
                child: Image.asset('assets/pokeball.png',width: 200,)
            ),
            SizedBox(height: 10,),
            headingText(color: Colors.white, size: 20, text: "Welcome to the world of pokemon!"),
            Spacer(),
            headingText(color: Colors.white, size: 20, text: "@pokemon"),
            SizedBox(height: 20,)
          ],
        ),

      ),
    );
  }
}
