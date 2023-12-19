import 'package:flutter/material.dart';
import 'package:meat_shop/features/auth/presentation/view/login_view.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  int currentScreen = 1;
  final List<SplashScreenInfo> splashScreens = [
    SplashScreenInfo(
      imagePath: 'assets/images/splash1.png',
      title: 'Welcome to B-Shop',
      subtitle: 'Discover the Best in Fresh Meat',
    ),
    SplashScreenInfo(
      imagePath: 'assets/images/splash2.png',
      title: 'Quality Meats at Your Fingertips',
      subtitle: 'Wide Range of Cuts and Meat Products',
    ),
    SplashScreenInfo(
      imagePath: 'assets/images/splash3.png',
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
                  onSkip: _skipScreens,
                )
              : const LoginView(),
                  // Replace MainApp() with your main application screen
          ),
    );
  }

  void _nextScreen() {
    if (currentScreen < splashScreens.length) {
      setState(() {
        currentScreen++;
      });
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const LoginView()));
  
    }
  }

  void _skipScreens(){
    setState(()=> currentScreen = splashScreens.length+1);
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
  final VoidCallback onSkip;


  SplashScreen({
    required this.info,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
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
              Expanded(
                flex: 7, // Occupies 70% of the available space
                child: Container(), // Empty container to push the content
              ),
              Expanded(
                flex: 3, // Occupies 30% of the available space
                child: FractionallySizedBox(
                  heightFactor:
                      0.7, // Positions the content at 70% from the top
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        info.title,
                        textAlign: info.align,
                        style:Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        info.subtitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: onNext,
                child: Text(
                  'Next',
                  style: Theme.of(context).textTheme.displayMedium
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: onSkip,
                child: Text(
                  'Skip',
                  style:Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
