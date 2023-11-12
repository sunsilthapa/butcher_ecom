import 'package:flutter/material.dart';
import 'package:meat_shop/utils/app_fonts.dart';

class CartPageView extends StatefulWidget {
  const CartPageView({ Key? key }) : super(key: key);

  @override
  _CartPageViewState createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Add to Cart", style: AppFonts.headingText(),),
      
    );
  }
}