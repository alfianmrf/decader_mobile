import 'package:decader/screen/account_screen.dart';
import 'package:decader/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget{
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen>{
  Color orange = const Color.fromRGBO(244, 144, 31, 1);
  final List _screens = [
    DashboardScreen(),
    AccountScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.person]
            .asMap()
            .map(
                (key, value) => MapEntry(key,
                    BottomNavigationBarItem(
                        title: Text(''),
                        icon: Container(padding: const EdgeInsets.symmetric(
                            vertical: 6.0,
                            horizontal: 16.0,
                          ),
                          decoration: BoxDecoration(
                              color: _currentIndex == key ? orange : Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Icon(value),
                        ),
                    ),)
        ).values.toList(),
      ),
    );
  }
}
