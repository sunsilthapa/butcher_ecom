import 'package:flutter/material.dart';

class FavoritePageView extends StatefulWidget {
  const FavoritePageView({ Key? key }) : super(key: key);

  @override
  _FavoritePageViewState createState() => _FavoritePageViewState();
}

class _FavoritePageViewState extends State<FavoritePageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Favorite"),
    );
  }
}