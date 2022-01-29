import 'package:flutter/material.dart';
import 'package:pipa/helping_materials/colors.dart';
import 'package:pipa/helping_materials/helping_material.dart';
import 'package:pipa/helping_materials/scalling.dart';
import 'package:pipa/views/scanning_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  @override
  Widget build(BuildContext context) {
    init(context);
    return Container(
      width: screenWidth,
      height: screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Container(
            width: width(202),
            height: height(168),
            child:Image.asset('assets/scanner.png'),
          ),
          Padding(
            padding: EdgeInsets.only(left: width(76),right:width(76),bottom: height(51)),
            child: Button(text: AppLocalizations.of(context)!.scanQRCode,fontSizs: width(16),fontWeight: FontWeight.w500,
              buttonColor: yellow,borderColor: yellow,radius: 27,
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>ScanningModel()));

              // showDialog(
              //     context: context,
              //     builder: (BuildContext context) => ClosingDetailsDialog());
            },
            ),
          ),

        ],
      ),
    );
  }
}