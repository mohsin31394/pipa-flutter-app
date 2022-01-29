import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pipa/helping_materials/colors.dart';
import 'package:pipa/helping_materials/helping_material.dart';
import 'package:pipa/helping_materials/scalling.dart';
import 'package:pipa/views/home_screen.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ScanningModel extends StatefulWidget {
  const ScanningModel({Key? key}) : super(key: key);

  @override
  _ScanningModelState createState() => _ScanningModelState();
}

class _ScanningModelState extends State<ScanningModel> {

  String _chosenValue='Choose a task';
  final List<Map<String, dynamic>> _items = [
    {'value': 'Picking'},
    {'value': 'Cleaning'},
    {'value': 'Cutting'},
    {'value': 'Threading'},
    {'value': 'Sweeping'}
  ];

  String _salutation = "Day"; //This is the selection value. It is also present in my array.
  late List<String> _salutations;
  static onChange(String value) {
    print('aaaaaaaaaaaaaaaaaaaaa');
    print(value.toString());
  }


  @override
  void initState() {
    super.initState();


  }

  String _scanBarcode='Unknown';
  bool isTrue=false;
  @override
  Widget build(BuildContext context) {
    _salutations = [
      AppLocalizations.of(context)!.picking, AppLocalizations.of(context)!.cleaning,
      AppLocalizations.of(context)!.cutting, AppLocalizations.of(context)!.threading,
      AppLocalizations.of(context)!.sweeping,
    ];
    init(context);
    return Scaffold(
      appBar: AppBar(

        title: SimpleText(AppLocalizations.of(context)!.assignTask,
            color: black,
            fontWeight: FontWeight.w600,
            fontSize: width(15)),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.of(context, rootNavigator: true).pop();
          },
          child:  Center(
            child: Icon(Icons.arrow_back_rounded,size: width(28),color: black,),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              DropDownMenu(callback: onChange,menuList: _salutations,
                hintText: AppLocalizations.of(context)!.chooseATask,hintTextColor: darkGrey,
                textColor: black,fieldColor: offWhite,dropDownColor: offWhite,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      await scanQR(context);
                    },
                    child: Container(
                      width: width(162),
                      height: width(162),
                      decoration: BoxDecoration(
                        color: offWhite,
                        borderRadius: BorderRadius.circular(width(15)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: width(107),
                            height: width(89),
                            child:Image.asset('assets/scanner.png'),
                          ),
                          SimpleText(AppLocalizations.of(context)!.scanByLocationId,
                              color: black,
                              fontWeight: FontWeight.w500,
                              fontSize: width(13)),

                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await scanQR(context);
                    },
                    child: Container(
                      width: width(162),
                      height: width(162),
                      decoration: BoxDecoration(
                        color: offWhite,
                        borderRadius: BorderRadius.circular(width(15)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: width(107),
                            height: width(89),
                            child:Image.asset('assets/scanner.png'),
                          ),
                          SimpleText(AppLocalizations.of(context)!.scanByEmployeeId,
                              color: black,
                              fontWeight: FontWeight.w500,
                              fontSize: width(13)),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width(76),right:width(76),bottom: height(51)),
                child: Button(text: AppLocalizations.of(context)!.finish,fontSizs: width(16),fontWeight: FontWeight.w500,
                  buttonColor: green,borderColor: green,radius: 27,onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>HomeScreen()));
                  },),
              ),


            ],
          ),
        ),
      ),

    );
  }
  Future<void> scanQR(BuildContext context) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#FFC72C', AppLocalizations.of(context)!.cancel, true, ScanMode.QR);
      //print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return;
    }
    setState(() {
      _scanBarcode = barcodeScanRes;
      if(_scanBarcode==-1){
        isTrue=false;
        _scanBarcode='Unknown';
      }else{
        isTrue=true;}
    });
    print('barrrrrrrrrrrrrrrrrrrr $_scanBarcode');
  }



}

class ClosingDetailsDialog extends StatelessWidget {
  final color;
  ClosingDetailsDialog({this.color=Colors.white});
  @override
  Widget build(BuildContext context) {
    init(context);
    var dialogWidth=width(335);
    var dialogHeight=height(520);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: dialogWidth,
        height: dialogHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width(11)),
        ),
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: width(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SimpleText(AppLocalizations.of(context)!.picking,
                  color: black,
                  fontWeight: FontWeight.w500,
                  fontSize: width(18)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SimpleText(AppLocalizations.of(context)!.date,
                      color: darkGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: width(14)),
                  SimpleText('16/5/20222',
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: width(14)),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SimpleText(AppLocalizations.of(context)!.hour,
                      color: darkGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: width(14)),
                  SimpleText('8',
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: width(14)),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: dialogWidth/2,
                    child: SimpleText(AppLocalizations.of(context)!.supervisorBadgeNumber,
                        color: darkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: width(14)),
                  ),
                  SimpleText('123456',
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: width(14)),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: dialogWidth/2,
                    child: SimpleText(AppLocalizations.of(context)!.employeeBadgeNumber,
                        color: darkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: width(14)),
                  ),
                  SimpleText('123456',
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: width(14)),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SimpleText(AppLocalizations.of(context)!.locationNumber,
                      color: darkGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: width(14)),
                  SimpleText('123abc',
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: width(14)),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SimpleText(AppLocalizations.of(context)!.boxNumber,
                      color: darkGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: width(14)),
                  SimpleText('123abc',
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: width(14)),

                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width(40),right:width(40),bottom: height(20)),
                child: Button(text: AppLocalizations.of(context)!.finish,fontSizs: width(16),fontWeight: FontWeight.w500,
                  buttonColor: green,borderColor: green,radius: 27,
                onTap: (){
                  Navigator.of(context, rootNavigator: true).pop();
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}