import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipa/helping_materials/colors.dart';
import 'package:pipa/helping_materials/helping_material.dart';
import 'package:pipa/helping_materials/scalling.dart';
import 'package:pipa/views/change_language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);


  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with TickerProviderStateMixin{

  bool notification=false;
  bool emailNotification=false;
  bool phoneNotification=false;



  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(

      appBar: AppBar(
        title: SimpleText(AppLocalizations.of(context)!.settings,
            color: black,
            fontWeight: FontWeight.w600,
            fontSize: width(15)),
        centerTitle: true,
        leading:InkWell(
          onTap: (){
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Center(
            child: Icon(Icons.arrow_back_rounded,size: width(28),color: black,),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(40)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top:height(60)),
                child: InkWell(
                  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>ChangeLanguage())),
                  child: Row(
                    children: [
                      Image.asset('assets/language.png',width: width(20),
                        height: width(20),),
                      SizedBox(width: width(28),),
                      SimpleText(AppLocalizations.of(context)!.changeLanguage,
                          color: black,
                          fontWeight: FontWeight.w400,
                          fontSize: width(15)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:height(55)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/notification.png',width: width(22)
                          ,height: width(22),),
                        SizedBox(width: width(28),),
                        SimpleText(AppLocalizations.of(context)!.notifications,
                            color: black,
                            fontWeight: FontWeight.w400,
                            fontSize: width(15)),
                      ],
                    ),
                    Transform.scale(
                        scale: 1.25,
                        child: Switch(
                          value: notification,
                          activeColor: green,
                          activeTrackColor: backgroundColor,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: backgroundColor,
                          onChanged: (bool value) {
                            setState(() {
                              notification=value;
                            });
                          },
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:height(55)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/email.png',width: width(21),
                          height: width(21),),
                        SizedBox(width: width(28),),
                        SimpleText(AppLocalizations.of(context)!.emailNotifications,
                            color: black,
                            fontWeight: FontWeight.w400,
                            fontSize: width(15)),
                      ],
                    ),
                    Transform.scale(
                        scale: 1.25,
                        child: Switch(
                          value: emailNotification,
                          activeColor: green,
                          activeTrackColor: backgroundColor,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: backgroundColor,
                          onChanged: (bool value) {
                            setState(() {
                              emailNotification=value;
                            });
                          },
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:height(55)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/notification.png',width: width(22),
                          height: width(22),),
                        SizedBox(width: width(28),),
                        SizedBox(
                          width: screenWidth/2,
                          child: SimpleText(AppLocalizations.of(context)!.notificationsByPhone,
                              color: black,
                              fontWeight: FontWeight.w400,
                              fontSize: width(15)),
                        ),
                      ],
                    ),
                    Transform.scale(
                        scale: 1.25,
                        child: Switch(
                          value: phoneNotification,
                          activeColor: green,
                          activeTrackColor: backgroundColor,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: backgroundColor,
                          onChanged: (bool value) {
                            setState(() {
                              phoneNotification=value;
                            });
                          },
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:height(55)),
                child: Row(
                  children: [
                    Image.asset('assets/permission.png',width: width(22),
                      height: width(22),),
                    SizedBox(width: width(28),),
                    SimpleText(AppLocalizations.of(context)!.permissions,
                        color: black,
                        fontWeight: FontWeight.w400,
                        fontSize: width(15)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),


    );

  }
}