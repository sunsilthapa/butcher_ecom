import 'package:flutter/material.dart';
import 'package:meat_shop/app/routes/app_routes.dart';

class App extends StatelessWidget {
const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Course",
      initialRoute: AppRoute.splashPageRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}