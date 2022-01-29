import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pipa/helping_materials/colors.dart';
import 'package:pipa/helping_materials/helping_material.dart';
import 'package:pipa/helping_materials/scalling.dart';
import 'package:pipa/views/home_screen.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late String _salutation; //This is the selection value. It is also present in my array.
  late List<String> _salutations;
  static onChange(String value) {
    print('aaaaaaaaaaaaaaaaaaaaa');
    print(value.toString());
  }


  @override
  void initState() {
    super.initState();

    // Future.delayed(Duration.zero, () {
    //   _salutations = [
    //     AppLocalizations.of(context)!.day,
    //     AppLocalizations.of(context)!.night
    //   ];
    //   _salutation=AppLocalizations.of(context)!.day;
    // });

  }

  @override
  Widget build(BuildContext context) {
    _salutations = [
      AppLocalizations.of(context)!.day,
      AppLocalizations.of(context)!.night
    ];
    _salutation=AppLocalizations.of(context)!.day;
    init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Align(
              alignment:Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: screenHeight*0.10,),
                  Image.asset('assets/logoIcon.png',width: width(157),height: width(186),),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth,
                height: screenHeight*0.61,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(width(25)),topRight: Radius.circular(width(25))),
                  color: green,
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width(30)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight*0.020),
                        child: SimpleText(AppLocalizations.of(context)!.login,fontWeight: FontWeight.w600,fontSize: width(20),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight*0.022),
                        child: Row(
                          children: [
                            SimpleText(AppLocalizations.of(context)!.username,fontWeight: FontWeight.w400,fontSize: width(15),),
                          ],
                        ),
                      ),
                      TextFieldClass(padding: 0.012,),


                      Padding(
                        padding: EdgeInsets.only(top: screenHeight*0.022),
                        child: Row(
                          children: [
                            SimpleText(AppLocalizations.of(context)!.password,fontWeight: FontWeight.w400,fontSize: width(15),),
                          ],
                        ),
                      ),
                      TextFieldClass(padding: 0.012,),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight*0.008),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SimpleText(AppLocalizations.of(context)!.forgetPassword,fontWeight: FontWeight.w400,fontSize: width(15),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight*0.010),
                        child: Row(
                          children: [
                            SimpleText(AppLocalizations.of(context)!.shift,fontWeight: FontWeight.w400,fontSize: width(15),),
                          ],
                        ),
                      ),

                      DropDownMenu(callback: onChange,menuList: _salutations,initialValue: _salutation,
                        textColor: Colors.white,fieldColor: textFieldColor,dropDownColor: textFieldColor,),

                      // SelectFormField(
                      //   showCursor: false,
                      //   style: GoogleFonts.poppins(
                      //       textStyle: const TextStyle(
                      //         color: Colors.white,
                      //       )),
                      //   decoration: InputDecoration(
                      //     floatingLabelBehavior: FloatingLabelBehavior.never,
                      //     labelText: "Day",
                      //     labelStyle: TextStyle(
                      //       color: Colors.white,
                      //     ),
                      //     // hintText: '',
                      //     contentPadding: EdgeInsets.only(
                      //         top: 5),
                      //     filled: true,
                      //     fillColor: textFieldColor,
                      //     focusColor: Colors.white,
                      //     enabledBorder: myinputborder(), //enabled border
                      //     focusedBorder: myfocusborder(),
                      //     prefixIcon:SizedBox(),
                      //     suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.white,)
                      //   ),
                      //
                      //   //cursorColor: Color(0xffF1F4F1),
                      //   // validator: (value) {
                      //   //   if (_chosenValue.contains(
                      //   //       'Select Category'))
                      //   //     return 'please Select Category';
                      //   // },
                      //   cursorColor: Colors.white,
                      //   type: SelectFormFieldType.dropdown,
                      //   // or can be dialog
                      //   initialValue: 'Day',
                      //   textAlign: TextAlign.start,
                      //   items: _items,
                      //   onChanged: (val) {
                      //     setState(() {
                      //       _chosenValue = val;
                      //     });
                      //   },
                      //   onSaved: (val) => print(val),
                      // ),

                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder:
                                (context) =>
                                HomeScreen(isEmpty: true,)
                            )
                        );
                      },
                      child: Image.asset('assets/loginBottom.png',
                        width: screenWidth,height: screenHeight*0.1,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:Padding(
                      padding: EdgeInsets.only(bottom: height(23)),
                      child: InkWell(
                          onTap: (){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder:
                                    (context) =>
                                    HomeScreen(isEmpty: true,)
                                )
                            );
                          },
                          child: SimpleText(AppLocalizations.of(context)!.login,fontSize: width(16),fontWeight: FontWeight.w600,)),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),

      ),
    );
  }



}

