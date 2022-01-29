import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipa/helping_materials/colors.dart';
import 'package:pipa/helping_materials/helping_material.dart';
import 'package:pipa/helping_materials/scalling.dart';
import 'package:pipa/views/scanning_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OpenTaskDetails extends StatefulWidget {
  const OpenTaskDetails({Key? key}) : super(key: key);

  @override
  _OpenTaskDetailsState createState() => _OpenTaskDetailsState();
}

class _OpenTaskDetailsState extends State<OpenTaskDetails> {
  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      appBar: AppBar(
        title: SimpleText(AppLocalizations.of(context)!.pickingDetails,
            color: black,
            fontWeight: FontWeight.w600,
            fontSize: width(15)),
        centerTitle: true,
        leading: InkWell(
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
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      print('click');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: height(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SimpleText(AppLocalizations.of(context)!.date,
                              color: black,
                              fontWeight: FontWeight.w600,
                              fontSize: width(16)),
                          SimpleText('16/5/20222',
                              color: darkGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: width(16)),

                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SimpleText(AppLocalizations.of(context)!.time,
                            color: black,
                            fontWeight: FontWeight.w600,
                            fontSize: width(16)),
                        SimpleText('10:00 AM',
                            color: darkGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: width(16)),

                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SimpleText(AppLocalizations.of(context)!.supervisorId,
                            color: black,
                            fontWeight: FontWeight.w600,
                            fontSize: width(16)),
                        SimpleText('1234567',
                            color: darkGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: width(16)),

                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SimpleText(AppLocalizations.of(context)!.employeeId,
                            color: black,
                            fontWeight: FontWeight.w600,
                            fontSize: width(16)),
                        SimpleText('1234567',
                            color: darkGrey,
                            fontWeight: FontWeight.w400,
                            fontSize: width(16)),

                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SimpleText(AppLocalizations.of(context)!.status,
                            color: black,
                            fontWeight: FontWeight.w600,
                            fontSize: width(16)),
                        SimpleText(AppLocalizations.of(context)!.open,
                            color: yellow,
                            fontWeight: FontWeight.w600,
                            fontSize: width(16)),

                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width(76),right:width(76),bottom: height(51)),
                child: Button(text: AppLocalizations.of(context)!.close,fontSizs: width(16),fontWeight: FontWeight.w500,
                  buttonColor: red,borderColor: red,radius: 27,
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => ClosingDetailsDialog());
                },),
              ),

            ],
          ),
        ),
      ),
    );
  }
}