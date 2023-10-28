import 'package:flutter/material.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/commons.dart';
import '../widgets/button.dart';
import '../widgets/colors.dart';
import '../widgets/fonts.dart';
import '../widgets/media.dart';
import '../widgets/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
  required this.animateBottom
  ,Key? key}) : super(key: key);
  final bool animateBottom;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animated = false;
  @override

  void initState() {
    super.initState();
    startAnimation();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth= MediaQuery.of(context).size.width;
    double screenHeight= MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colours.primaryColour,
      body:Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(Media.splashBackground),

          )
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              bottom: animated? screenHeight*0.5: 0,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage(Media.logo1),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 2000),
              bottom: animated? (widget.animateBottom)?screenHeight*0.2:0: -500,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage(Media.logo2),
              ),
            ),
            if(widget.animateBottom)
            AnimatedPositioned(
              onEnd: (){
                //TODO(move to home page):
              },
              duration: const Duration(milliseconds: 2000),
              bottom: animated? screenHeight*0.001: -600,
              left: 0,
              right: 0,
              child: Container(
                width: screenWidth,

                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20),),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                   const   Text(
                          "اهلا بك",

                        style: Styles.textStyle40,

                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyButton(
                        onPressed: (){
                          navigatePushReplacement(context: context, route: Routes.signIN);
                  },
                        buttonColor: Colours.primaryColour,
                        child: const Text("تسجيل الدخول", style:  TextStyle(
                            color: Colors.white,
                          fontFamily: Fonts.cairo,

                        ),),
                      ),
                      MyButton(
                        onPressed: (){
                          navigatePushNamed(context: context, route: Routes.signUp);


                        },


                        buttonColor: Colors.white,
                        border: Border.all(color: Colours.primaryColour),
                        child: const Text("انشاء حساب", style:  TextStyle(
                            color: Colours.primaryColour ,
                          fontFamily: Fonts.cairo,
                        ),),
                      ),
                    ],
                  ),
                ),

              ),
            ),
          ],
        ),
      ) ,

    );
  }

  Future startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animated=true;
    });
  }
}
