import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:positive_banking/widgets/app_title.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          AppTitle(
            fontSize: 25,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      toolbarHeight: 110,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.0),
          bottomRight: Radius.circular(35.0),
        ),
      ),
      elevation: 5.0,
    );
  }
}
