import 'package:flutter/material.dart';
import 'package:pipa/helping_materials/colors.dart';
import 'package:pipa/helping_materials/helping_material.dart';
import 'package:pipa/helping_materials/scalling.dart';
import 'package:pipa/views/closed_task.dart';
import 'package:pipa/views/login_screen.dart';
import 'package:pipa/views/open_task.dart';
import 'package:pipa/views/qrcode_scanner.dart';
import 'package:pipa/views/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);
  final isEmpty;
  HomeScreen({this.isEmpty=false});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  List<Widget> _tabBarActionList = <Widget>[
    OpenTask(),
    ClosedTask(),
  ];
  int initalIndex=0;


  @override
  void initState() {
    super.initState();
    if(widget.isEmpty){
      _tabBarActionList=[
        QRScanner(),
        QRScanner(),
      ];
    }
  }
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(28)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top:height(53)),
                  child: Image.asset('assets/logoPic.png',width: width(133.57),height: width(133.57),),
                ),
                Padding(
                  padding: EdgeInsets.only(top:height(63)),
                  child: Row(
                    children: [
                      Image.asset('assets/tasks.png',width: width(14),height: width(22),),
                      SizedBox(width: width(28),),
                      SimpleText(AppLocalizations.of(context)!.openTasks,
                          color: black,
                          fontWeight: FontWeight.w400,
                          fontSize: width(15)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:height(36.91)),
                  child: Row(
                    children: [
                      Image.asset('assets/tasks.png',width: width(14),height: width(22),),
                      SizedBox(width: width(28),),
                      SimpleText(AppLocalizations.of(context)!.closedTasks,
                          color: black,
                          fontWeight: FontWeight.w400,
                          fontSize: width(15)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:height(36.91)),
                  child: InkWell(
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>Settings())),
                    child: Row(
                      children: [
                        Image.asset('assets/settings.png',width: width(19.41),
                          height: width(19.41),),
                        SizedBox(width: width(28),),
                        SimpleText(AppLocalizations.of(context)!.settings,
                            color: black,
                            fontWeight: FontWeight.w400,
                            fontSize: width(15)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:height(36.91)),
                  child: Row(
                    children: [
                      Image.asset('assets/version.png',width: width(20),
                        height: width(20),),
                      SizedBox(width: width(28),),
                      SimpleText('${AppLocalizations.of(context)!.version} 1.0',
                          color: black,
                          fontWeight: FontWeight.w400,
                          fontSize: width(15)),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom:height(39)),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>LoginScreen()));
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/logout.png',width: width(20),
                          height: width(20),),
                        SizedBox(width: width(28),),
                        SimpleText(AppLocalizations.of(context)!.logout,
                            color: black,
                            fontWeight: FontWeight.w400,
                            fontSize: width(15)),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: SimpleText(widget.isEmpty?AppLocalizations.of(context)!.home:
        AppLocalizations.of(context)!.tasks,
            color: black,
            fontWeight: FontWeight.w600,
            fontSize: width(15)),
        centerTitle: true,
        leading:widget.isEmpty? InkWell(
          onTap: ()=>_key.currentState!.openDrawer(),
          child: Center(
            child: Container(
                width: width(20),
                height: height(18),
                child:Image.asset('assets/drawerIcon.png')),
          ),
        ):InkWell(
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
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: 100.0),
              child: Material(
                color: offWhite,
                child: AbsorbPointer(
                  absorbing: widget.isEmpty,
                  child: TabBar(
                    labelColor: black,
                    indicator: BoxDecoration(
                        color:widget.isEmpty?offWhite: yellow,
                        border: Border(right: BorderSide(color:widget.isEmpty?green:yellow))),
                    onTap: (index) {
                      setState(() {
                        initalIndex = index;
                      });
                    },
                    indicatorColor: offWhite,
                    tabs: [
                      Tab(
                          child: SimpleText(
                            widget.isEmpty?AppLocalizations.of(context)!.openTasks:
                            AppLocalizations.of(context)!.openedTasks,
                            color:widget.isEmpty?darkGrey:initalIndex==0?Colors.white: darkGrey,
                            fontSize: width(14),
                            fontWeight: FontWeight.w500,
                          )),
                      Tab(
                          child: SimpleText(
                            widget.isEmpty?AppLocalizations.of(context)!.closeTasks:
                            AppLocalizations.of(context)!.closedTasks,
                            color:widget.isEmpty?darkGrey:initalIndex==1?Colors.white:  darkGrey,
                            fontSize: width(14),
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                //controller: _controller,
                children: _tabBarActionList,
              ),
            ),
          ],
        ),
      ),

    );

  }
}