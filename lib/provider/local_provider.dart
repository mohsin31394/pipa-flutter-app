import 'package:flutter/material.dart';
import 'package:pipa/l10n/l10n.dart';
import 'dart:ui';

class LocaleProvider extends ChangeNotifier{
   Locale? _locale;
   LocaleProvider({locale}){
     if(locale.contains('en'))
       _locale=Locale('en');
     if(locale.contains('fr'))
       _locale=Locale('fr');

   }

  Locale? get locale=>_locale;
  void setLocale(Locale locale){
    if(!L10n.all.contains(locale))return;
    _locale=locale;
    notifyListeners();
  }
  void clearLocale(){
    _locale=null;
    notifyListeners();
  }
}