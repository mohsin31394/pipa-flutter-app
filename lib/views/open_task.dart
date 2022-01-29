import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pipa/helping_materials/colors.dart';
import 'package:pipa/helping_materials/helping_material.dart';
import 'package:pipa/helping_materials/scalling.dart';
import 'package:pipa/widgets/card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OpenTask extends StatefulWidget {
  const OpenTask({Key? key}) : super(key: key);

  @override
  _OpenTaskState createState() => _OpenTaskState();
}

class _OpenTaskState extends State<OpenTask> {
  String _scanBarcode='Unknown';
  bool isTrue=false;
  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: yellow,
        child: Center(
          child: Container(
            width: width(22),
            height: height(22),
            child:Image.asset('assets/floatingIcon.png'),
          ),
        ),
        onPressed: () async {
          await scanQR(context);
        },

      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: width(76),right:width(76),bottom: height(21)),
        child: Button(text: AppLocalizations.of(context)!.closeAll,fontSizs: width(16),fontWeight: FontWeight.w500,
          buttonColor: red,borderColor: red,radius: 27,
          onTap: (){
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) =>ScanningModel()));

            // showDialog(
            //     context: context,
            //     builder: (BuildContext context) => ClosingDetailsDialog());
          },
        ),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: width(20),right: width(20)),
          child: ListView.separated(
            shrinkWrap: true,
              itemBuilder:(context,index)=>Padding(
                padding: EdgeInsets.only(top: index==0?width(10):0),
                child: TaskCard(isOpenTask: true,index: index,),
              ) ,
              separatorBuilder: (context,index)=>SizedBox(height: width(8),),
              itemCount: 5),
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