import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{

  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: Color.fromRGBO(0, 106, 128, 1),
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}