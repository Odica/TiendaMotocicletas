import 'package:flutter/material.dart';
import 'package:tienda_online/screens/custom_scaffold.dart';


class Accesorio extends StatelessWidget {
  const Accesorio ({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SingleChildScrollView(
        child:Center (child: Text("Accesorio")),
      ),
      showBottomNavBar: true,
      initialIndex: 1,
    );
  }
}