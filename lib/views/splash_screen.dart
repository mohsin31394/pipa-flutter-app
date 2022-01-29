import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pipa/helping_materials/colors.dart';
import 'package:pipa/helping_materials/scalling.dart';
import 'package:pipa/views/login_screen.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) =>
                  LoginScreen()
          )
      );
    }
    );

  }
  int cIndex=0;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {

    init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            SizedBox(height: screenHeight*0.12,),
            Image.asset('assets/logoIcon.png',width: width(127),height: width(150),),
            SizedBox(height: screenHeight*0.339,),
            Container(
              height: width(7),
              width: width(50),
              child: CarouselSlider.builder(
                enableAutoSlider: true,
                autoSliderTransitionTime:const Duration(milliseconds: 500),
                autoSliderDelay:const Duration(milliseconds: 500),
                autoSliderTransitionCurve: Curves.bounceIn,
                unlimitedMode: true,
                slideBuilder: (sIndex) {
                  changeIndex(sIndex);
                  return Center(
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return SizedBox();
                        }, separatorBuilder:(context,index)=>SizedBox(width: 5,) , itemCount: 3),
                  );
                },

                itemCount:3,
                initialPage: 0,
              ),
            ),
            cIndex==0?
            Container(
              height: width(7),
              width: width(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width(14),
                    height:width(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      shape:BoxShape.rectangle,
                      color: green,
                    ),
                  ),
                  SizedBox(width: width(5),),
                  Container(
                    width: width(7),
                    height:width(7),
                    decoration: BoxDecoration(
                      shape:BoxShape.circle,
                      color: silver,
                    ),
                  ),
                  SizedBox(width: width(5),),
                  Container(
                    width: width(7),
                    height:width(7),
                    decoration: BoxDecoration(
                      shape:BoxShape.circle,
                      color: silver,
                    ),
                  ),
                ],
              ),
            ):
            cIndex==1?
            Container(
              height: width(7),
              width: width(50),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    width: width(7),
                    height:width(7),
                    decoration: BoxDecoration(
                      shape:BoxShape.circle,
                      color: silver,
                    ),
                  ),
                  SizedBox(width: width(5),),
                  Container(
                    width: width(14),
                    height:width(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      shape:BoxShape.rectangle,
                      color: green,
                    ),
                  ),
                  SizedBox(width: width(5),),
                  Container(
                    width: width(7),
                    height:width(7),
                    decoration: BoxDecoration(
                      shape:BoxShape.circle,
                      color: silver,
                    ),
                  ),
                ],
              ) ,
            ) :
            Container(
              height: width(7),
              width: width(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    width: width(7),
                    height:width(7),
                    decoration: BoxDecoration(
                      shape:BoxShape.circle,
                      color: silver,
                    ),
                  ),
                  SizedBox(width: width(5),),
                  Container(
                    width: width(7),
                    height:width(7),
                    decoration: BoxDecoration(
                      shape:BoxShape.circle,
                      color: silver,
                    ),
                  ),
                  SizedBox(width: width(5),),
                  Container(
                    width: width(14),
                    height:width(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      shape:BoxShape.rectangle,
                      color: green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight*0.006,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(AppLocalizations.of(context)!.loading,style: TextStyle(
                fontSize: width(12),
                color: darkGrey,
              ),),
            ),
            SizedBox(height: screenHeight*0.032,),
            Text(AppLocalizations.of(context)!.taskManager,style:GoogleFonts.poppins(
              textStyle:  TextStyle(
                fontSize: width(20),
                color: green,
                fontWeight: FontWeight.w600,
              ),
            )),

          ],
        ),

      ),
    );
  }
  changeIndex(index){
    WidgetsBinding.instance!.addPostFrameCallback((_){

      setState(() {
        cIndex=index;
      });  // Add Your Code here.

    });

  }

}