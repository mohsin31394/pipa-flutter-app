import 'package:flutter/material.dart';
import 'package:pipa/helping_materials/scalling.dart';
import 'package:pipa/widgets/card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ClosedTask extends StatefulWidget {
  const ClosedTask({Key? key}) : super(key: key);

  @override
  _ClosedTaskState createState() => _ClosedTaskState();
}

class _ClosedTaskState extends State<ClosedTask> {
  @override
  Widget build(BuildContext context) {
    init(context);
    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: width(20),right: width(20)),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder:(context,index)=>Padding(
              padding: EdgeInsets.only(top: index==0?width(10):0),
              child: TaskCard(),
            ) ,
            separatorBuilder: (context,index)=>SizedBox(height: width(8),),
            itemCount: 5),
      ),
    );
  }
}