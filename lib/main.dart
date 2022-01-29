import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pipa/l10n/l10n.dart';
import 'package:pipa/provider/local_provider.dart';
import 'package:pipa/views/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  var prefs=await SharedPreferences.getInstance();
    if(prefs.getString('language')!=null){
      defaultLocale=prefs.getString('language');

    }else{
      defaultLocale = Platform.localeName;
    }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

var defaultLocale;

class _MyAppState extends State<MyApp> {



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      create: (context)=>LocaleProvider(locale: defaultLocale),
      builder: (context,child){
        final provider=Provider.of<LocaleProvider>(context);

        print('lllllllllllllllllll ${defaultLocale.toString()}');
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],

          locale: provider.locale,
          // localizationsDelegates: [
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate
          // ],
          // localeResolutionCallback: (locale, supportedLocales) {
          //   for (var supportedLocale in supportedLocales) {
          //     if (supportedLocale.languageCode == locale!.languageCode &&
          //         supportedLocale.countryCode == locale.countryCode) {
          //       return supportedLocale;
          //     }
          //   }
          //   return supportedLocales.first;
          // },
          home: SplashScreen(),
        );
      },
    );
  }
}

// class MyApp extends StatefulWidget {
//
//
//   @override
//   _MyAppState createState() => _MyAppState();
//
//   // static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context)=>LocaleProvider(),
//       builder: (context,child){
//         final provider=Provider.of<LocaleProvider>(context);
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Afghanistan',
//           theme: ThemeData(primaryColor: Colors.blue[800]),
//           supportedLocales: L10n.all,
//           localizationsDelegates: [
//             AppLocalizations.delegate,
//             GlobalMaterialLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate
//           ],
//
//           locale: provider.locale,
//           // localizationsDelegates: [
//           //   GlobalMaterialLocalizations.delegate,
//           //   GlobalWidgetsLocalizations.delegate
//           // ],
//           // localeResolutionCallback: (locale, supportedLocales) {
//           //   for (var supportedLocale in supportedLocales) {
//           //     if (supportedLocale.languageCode == locale!.languageCode &&
//           //         supportedLocale.countryCode == locale.countryCode) {
//           //       return supportedLocale;
//           //     }
//           //   }
//           //   return supportedLocales.first;
//           // },
//           home: Dashboard(),
//         );
//       },
//     );
//   }
// }
//
// class Dashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextButton(
//           onPressed: () {  },
//           child: Text(AppLocalizations.of(context)!.language),
//           // onPressed: () => MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: 'de')),
//         ),
//         TextButton(
//           onPressed: () {
//             Provider.of<LocaleProvider>(context,listen: false).setLocale(Locale('ar'));
//           },
//           child: Text("Set locale to English"),
//           // onPressed: () => MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: 'en')),
//         ),
//       ],
//     );
//   }
// }
//


