import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipa/helping_materials/colors.dart';
import 'package:pipa/helping_materials/helping_material.dart';
import 'package:pipa/helping_materials/scalling.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pipa/provider/local_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

enum SingingCharacter { english, french }

class _ChangeLanguageState extends State<ChangeLanguage>
    with TickerProviderStateMixin {
  SingingCharacter? _character = SingingCharacter.english;
  bool isEnglish = true;
  bool isFrench = false;

  changeLanguageIndex(String value) async {
    SharedPreferences.getInstance().then((prefs){
      prefs.setString('language', value);
    });

  }


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<LocaleProvider>(context);
    if(provider.locale!.languageCode.contains('en')){
        isEnglish=true;
        isFrench=false;

    }else{
        isEnglish=false;
        isFrench=true;
    }


    init(context);
    return Scaffold(
      appBar: AppBar(
        title: SimpleText(AppLocalizations.of(context)!.changeLanguage,
            color: black, fontWeight: FontWeight.w600, fontSize: width(15)),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Center(
            child: Icon(
              Icons.arrow_back_rounded,
              size: width(28),
              color: black,
            ),
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
          padding: EdgeInsets.symmetric(horizontal: width(36)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height(63)),
                child: InkWell(
                  onTap: () {
                    Provider.of<LocaleProvider>(context,listen: false).setLocale(Locale('en'));
                    changeLanguageIndex('en');
                    setState(() {
                      isEnglish = true;
                      isFrench = false;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isEnglish
                          ? Container(
                              width: width(26),
                              height: width(26),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Container(
                                      width: width(26),
                                      height: width(26),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: backgroundColor),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: width(18),
                                      height: width(18),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle, color: green),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              width: width(26),
                              height: width(26),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: backgroundColor),
                            ),
                      SizedBox(
                        width: width(20),
                      ),
                      SimpleText(AppLocalizations.of(context)!.english,
                          fontSize: width(14),
                          fontWeight: FontWeight.w400,
                          color: black),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height(57)),
                child: InkWell(
                  onTap: () {
                    Provider.of<LocaleProvider>(context,listen: false).setLocale(Locale('fr'));
                    changeLanguageIndex('fr');
                    setState(() {
                      isEnglish = false;
                      isFrench = true;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isFrench
                          ? Container(
                              width: width(26),
                              height: width(26),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Container(
                                      width: width(26),
                                      height: width(26),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: backgroundColor),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: width(18),
                                      height: width(18),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle, color: green),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              width: width(26),
                              height: width(26),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: backgroundColor),
                            ),
                      SizedBox(
                        width: width(20),
                      ),
                      SimpleText(AppLocalizations.of(context)!.french,
                          fontSize: width(14),
                          fontWeight: FontWeight.w400,
                          color: black),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    return backgroundColor;
  }
}
