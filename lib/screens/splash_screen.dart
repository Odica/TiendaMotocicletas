import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tienda_online/screens/login_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin
{
  late AnimationController _animationController;
    @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      );
    _animationController.forward();
    Timer(const Duration(seconds: 4), (){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: _animationController, 
                  curve: Curves.linear,
                ),
              ),
              child: Image.asset('images/logo.png', height: 450),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 40,
        child: Text(
          '👾Powered By Claudia and Jordy👾',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black, 
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
    

 
  
 




