import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  String title;
  bool centerTitle;
  //List<Item> cartItens;
  bool actions;
  bool automaticallyImplyLeading;
  Icon? icon;

  CustomAppBar(
    this.title,
    this.icon, {
    this.centerTitle = true,
    this.actions = true,
    this.automaticallyImplyLeading = true,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    print("Recriando AppBar");
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      toolbarHeight: MediaQuery.of(context).size.height / 8,
      backgroundColor: Colors.green,
      title: Text(widget.title),
      centerTitle: widget.centerTitle,
      elevation: 0,
      leading: widget.icon,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
    );
  }
}
