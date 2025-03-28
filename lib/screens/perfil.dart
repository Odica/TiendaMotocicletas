import 'package:flutter/material.dart';
import 'package:tienda_online/screens/custom_scaffold.dart';


class Perfil extends StatelessWidget {
  const Perfil ({super.key});

  @override
  Widget build(BuildContext context) {
   return const CustomScaffold(
      body: SingleChildScrollView(
        child:Center (child: Text("Perfil")),
      ),
      showBottomNavBar: true,
      initialIndex: 2,
    );
  }
}