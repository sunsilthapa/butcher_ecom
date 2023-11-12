import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meat_shop/app/routes/app_routes.dart';

class App extends StatelessWidget {
const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    ScreenUtil.init(context);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meat Shop",
      initialRoute: AppRoute.splashPageRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}