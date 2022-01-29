import 'package:flutter/material.dart';
import 'package:pipa/helping_materials/colors.dart';
import 'package:pipa/helping_materials/helping_material.dart';
import 'package:pipa/helping_materials/scalling.dart';
import 'package:pipa/views/open_task_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskCard extends StatefulWidget {
  //const TaskCard({Key? key}) : super(key: key);
  final isOpenTask;
  final index;
   TaskCard({this.isOpenTask=false,this.index});
  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    init(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                OpenTaskDetails()));

      },
      child: Container(
          height: width(144),
          width: screenWidth,
          decoration: BoxDecoration(
            color: offWhite,
            borderRadius: BorderRadius.circular(width(6)),
          ),
          child: Row(
            children: [
              SizedBox(
                width: width(100),
                child: Center(
                  child: Container(
                    width: width(55),
                    height: width(58),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/yellowBox.png'),
                        fit: BoxFit.fill,
                      )
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SimpleText(AppLocalizations.of(context)!.picking,
                          color: black,
                          fontWeight: FontWeight.w600,
                          fontSize: width(14)),
                      if(widget.isOpenTask)
                      Container(
                        width: width(51.5),
                        height: width(18.1),
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(width(9.88)),
                        ),
                        child:Center(
                          child: SimpleText(AppLocalizations.of(context)!.open,
                              color: green,
                              fontWeight: FontWeight.w500,
                              fontSize: width(9)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_today_outlined,size: 16,color: black,),
                          SimpleText('  16/2/2022',
                              color: black,
                              fontWeight: FontWeight.w400,
                              fontSize: width(12)),
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SimpleText('S.ID ',
                              color: black,
                              fontWeight: FontWeight.w500,
                              fontSize: width(12)),
                          SimpleText('#12345678',
                              color: black,
                              fontWeight: FontWeight.w400,
                              fontSize: width(12)),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width(22)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        widget.isOpenTask&&widget.index%2==0?
                        Container(
                          width: width(62),
                          height: width(23.1),
                          decoration: BoxDecoration(
                            color: red,
                            shape: BoxShape.circle,
                          ),
                          child:Center(
                            child: Icon(Icons.check,size: 20,color: Colors.white,),
                          ),
                        ):
                        Container(
                          width: width(62),
                          height: width(23.1),
                          decoration: BoxDecoration(
                            color: widget.isOpenTask?red:green,
                            borderRadius: BorderRadius.circular(width(9.88)),
                          ),
                          child:Center(
                            child: SimpleText(widget.isOpenTask?AppLocalizations.of(context)!.close:
                            AppLocalizations.of(context)!.closed,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: width(10)),
                          ),
                        ),
                        if(widget.isOpenTask)
                        SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time_outlined,size: 16,color: black,),
                            SimpleText('  02:36 PM',
                                color: black,
                                fontWeight: FontWeight.w400,
                                fontSize: width(12)),
                          ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SimpleText('E.ID ',
                                color: black,
                                fontWeight: FontWeight.w500,
                                fontSize: width(12)),
                            SimpleText('#12345678',
                                color: black,
                                fontWeight: FontWeight.w400,
                                fontSize: width(12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
    );
  }
}
