import 'package:flutter/material.dart';
import 'package:tienda_online/screens/accesorio.dart';
import 'package:tienda_online/screens/carrito.dart';
import 'package:tienda_online/screens/home_screen.dart';
import 'package:tienda_online/screens/perfil.dart';

class BottomNavBar extends StatefulWidget{
  final int initialIndex;
  const BottomNavBar({super.key, required this.initialIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

  class _BottomNavBarState extends State<BottomNavBar>{
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped (int index){
    setState((){
      _selectedIndex = index;
    });
    switch(index){
      case 0: 
        _navigateToRoute(context, '/inicio', HomeScreen());
        break;
      case 1: 
        _navigateToRoute(context, '/accesorio', Accesorio());
        break;
      case 2: 
        _navigateToRoute(context, '/perfil', Perfil());
        break;
      case 3: 
        _navigateToRoute(context, '/carrito', Carrito());
        break;
    }
  }

  void _navigateToRoute(context, String routeName, Widget screen){
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExist = currentRouteName == routeName;

    if(routeExist){
      Navigator.popUntil(
        context,
        ModalRoute.withName(routeName)
      );
    } else {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => screen, 
          settings: RouteSettings(name: routeName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, 
            color: _selectedIndex == 0 ? Colors.green : Colors.black
        ), label: 'Inicio',
      ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_motorsports_outlined, 
            color: _selectedIndex == 1 ? Colors.green : Colors.black
        ), label: 'Acessorios',
      ),
        BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined, 
        color: _selectedIndex == 2 ? Colors.green : Colors.black
        ), label: 'Perfil',
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined, 
          color: _selectedIndex == 3 ? Colors.green : Colors.black
        ), label: 'Carrito',
      ),
    ]);
  }
}