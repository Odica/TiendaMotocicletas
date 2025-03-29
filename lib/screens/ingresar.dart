import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tienda_online/screens/home_screen.dart';
import 'package:tienda_online/screens/registrarse.dart';

class Ingresar extends StatefulWidget {
  const Ingresar({super.key});

  @override
  State<Ingresar> createState() => _IngresarState();
}

class _IngresarState extends State<Ingresar> {

  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null){
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Iniciar Sesión',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text('Porfavor ingresa para continuar.',
                style: TextStyle(fontSize: 20, 
                color:Colors.grey,
                ),
              ),
              SizedBox(height: 40,),
              TextFormField(
                controller: _emailAddressController,
                style: TextStyle(color: Colors.black, fontFamily:'SFUIDisplay'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'CORREO',
                  prefixIcon: Icon(Icons.email_outlined),
                  labelStyle: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(height: 10,),
                TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.black, fontFamily:'SFUIDisplay'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'CONTRASEÑA',
                  prefixIcon: Icon(Icons.lock_outlined),
                  suffixIcon: TextButton(
                    onPressed: (){},
                    child: Text('Olvidé mi contraseña', 
                    style: TextStyle(color: Colors.green),),
                  ),
                  labelStyle: TextStyle(fontSize: 12),
                ),
              ),
               SizedBox(height: 10,),
               Align(
                alignment: Alignment.centerRight,
                 child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: (){
                          FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailAddressController.text, 
                            password: _passwordController.text
                            ).
                            then((value) => {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder:(context) =>HomeScreen()))
                            });
                        }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('  INGRESAR',
                          style: TextStyle(color: Colors.black),),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward, size: 24.0, color: Colors.black,)
                        ],
                      ),
                   ),
                 ),
               )
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "¿No tienes cuenta?", 
              style: TextStyle(fontFamily: 'SFUIDisplay', color: Colors.black, fontSize: 15 ),
            ),
            TextButton(onPressed: (){
              Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Registrarse()));
            }, 
            child: Text(
              'Registrate',
                style: TextStyle(
                  fontFamily: 'SFUIDisplay',
                  color: Colors.green,
                  fontSize: 15,
                ),
            ),
            ),
          ],),
        ),
      ),
    );
  }
}