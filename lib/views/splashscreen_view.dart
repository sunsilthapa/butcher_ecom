import 'package:flutter/material.dart';
import 'package:meat_shop/app/routes/app_routes.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  int currentScreen = 1;
  final List<SplashScreenInfo> splashScreens = [
    SplashScreenInfo(
      imagePath: 'assets/splash1.jpg',
      title: 'Welcome to B-Shop',
      subtitle: 'Discover the Best in Fresh Meat',
    ),
    SplashScreenInfo(
      imagePath: 'assets/splash2.jpg',
      title: 'Quality Meats at Your Fingertips',
      subtitle: 'Wide Range of Cuts and Meat Products',
    ),
    SplashScreenInfo(
      imagePath: 'assets/splash3.jpg',
      title: 'Get Cooking with \n B-Shop',
      subtitle: 'Exclusive Offers Await You',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: currentScreen <= splashScreens.length
              ? SplashScreen(
                  info: splashScreens[currentScreen - 1],
                  onNext: _nextScreen,
                )
              : AppRoute.loginRoute
                  as Widget // Replace MainApp() with your main application screen
          ),
    );
  }

  void _nextScreen() {
    if (currentScreen < splashScreens.length) {
      setState(() {
        currentScreen++;
      });
    }
  }
}

class SplashScreenInfo {
  final String imagePath;
  final String title;
  final String subtitle;
  final TextAlign align;

  SplashScreenInfo(
      {required this.imagePath,
      required this.title,
      required this.subtitle,
      this.align = TextAlign.center});
}

class SplashScreen extends StatelessWidget {
  final SplashScreenInfo info;
  final VoidCallback onNext;

  SplashScreen({
    required this.info,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            info.imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                info.title,
                textAlign: info.align,
                style: const TextStyle(
                    fontSize: 34,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                info.subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                onPressed: onNext,
                icon: const Icon(Icons.arrow_right),
                label: const Text('Next'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
