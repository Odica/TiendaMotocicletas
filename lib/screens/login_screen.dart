import 'package:flutter/material.dart';
import 'package:tienda_online/screens/ingresar.dart';
import 'package:tienda_online/screens/registrarse.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/wallpaper.jpg'), fit: BoxFit.cover)
          ),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5, 120, 5, 100),
            ),
              Image.asset(
                'images/logotipo.png',
                height: 175,
              ),
            SizedBox(height: 50,),
            Button(onPressed:() { 
              Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Registrarse()));
             } , 
             text: 'REGISTRARSE',
             ),
             SizedBox(height: 45,),
               Button(onPressed:() { 
              Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Ingresar()));
             } , 
             text: 'INGRESAR',
             ),
          ],),
        )
      ),
    );
  }
}

class Button extends StatelessWidget {
  String text;
  final void Function() onPressed;
    Button({
    super.key, required this.text,required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
     
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0))),
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 22),
      )),
    );
  }
}  
