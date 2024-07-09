import 'package:flutter/material.dart';
import 'package:recipe_app/gen/assets.gen.dart';
import 'package:recipe_app/ui/constant/constant.dart';
import 'package:recipe_app/ui/router/route_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityLogo = 0;
  double opacityText = 0;

  void initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      opacityLogo = 1;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      opacityText = 1;
    });
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, routeDashboard);
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // align the logo a bit to the right for better centered look
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: setWidth(20)),
                AnimatedOpacity(
                  opacity: opacityLogo,
                  duration: const Duration(milliseconds: 300),
                  child: Image.asset(
                    Assets.icons.chef.path,
                    width: deviceWidth * 0.5,
                    height: setHeight(400),
                  ),
                ),
              ],
            ),

            AnimatedOpacity(
              opacity: opacityText,
              duration: const Duration(milliseconds: 300),
              child: Text(
                'Recipe App',
                style: styleTitle.copyWith(
                  fontSize: setFontSize(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
