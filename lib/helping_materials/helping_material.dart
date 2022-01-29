import 'dart:ffi';
import 'dart:io';
import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pipa/helping_materials/colors.dart';
import 'package:pipa/helping_materials/scalling.dart';

showSnackBar(String text,BuildContext context){
  final snackBar = SnackBar(
    content: Text(text),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
checkInternetConnection() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }else{
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
bool checkOpeningTime({required TimeOfDay currentTime, openTime, closeTime}) {
  List open = openTime.toString().split(':');
  List close = closeTime.toString().split(':');
  int openingHour = int.parse(open[0]);
  int openingMint = int.parse(open[1]);
  int closingHour = int.parse(close[0]);
  int closingMint = int.parse(close[1]);
  if (openingHour < int.parse(currentTime.hour.toString()) &&
      closingHour > int.parse(currentTime.hour.toString())) {
    return true;
    // if(openingMint<=int.parse(currentTime.minute.toString()) && closingHour>=int.parse(currentTime.hour.toString())
  } else if (openingHour == int.parse(currentTime.hour.toString())) {
    if (openingMint <= int.parse(currentTime.minute.toString())) {
      return true;
    } else {
      return false;
    }
  } else if (closingHour == int.parse(currentTime.hour.toString())) {
    if (closingMint > int.parse(currentTime.minute.toString())) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

class LoadingDialog extends StatelessWidget {
  final color;
  LoadingDialog({this.color=Colors.white});
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          color: Colors.transparent,
          child: Center(child: CircularProgressIndicator(color: color,)),
        ),
      ),
    );
  }
}
void showAlert(String text,BuildContext context, {Color backgroundColor = Colors.redAccent, int duration = 1, String title = 'Note',showAlertIcon=true}) {
  edgeAlert(
    context,
    title: title,
    duration: duration,
    backgroundColor: backgroundColor,
    description: text,
    gravity: Gravity.top,
    icon:showAlertIcon? Icons.info: Icons.email,
  );
}
void showToast(String text){
  Fluttertoast.showToast(msg: text);
}
class Button extends StatelessWidget {
  //const Button({Key? key}) : super(key: key);

  final double radius;
  final double width;
  final double heigth;
  final double sizeOfCenterWidget;
  final double sizeOfPrefixWidget;
  final double sizeOfSuffixWidget;
  final double fontSizs;
  final double borderWidth;
  final fontWeight;
  final fontFamily;
  final textStyle;
  final Color buttonColor;
  final Color borderColor;
  final String? text;
  final Color textColor;
  final VoidCallback? onTap;
  final Widget prefixWidget;
  final Widget suffixWidget;
  final Widget centerWidget;
  const Button({this.text,this.buttonColor=black,
  this.onTap,this.radius=10,this.width=double.infinity,this.heigth=50,
  this.sizeOfCenterWidget=20,this.sizeOfPrefixWidget=20,this.sizeOfSuffixWidget=20,
  this.fontSizs=12,this.fontWeight=FontWeight.normal,this.fontFamily,this.textStyle,
  this.textColor=Colors.white,this.centerWidget=const SizedBox(width: 0,),this.prefixWidget=const SizedBox(width: 0,),
  this.suffixWidget=const SizedBox(width: 0,), this.borderWidth=0,this.borderColor=black});



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: heigth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: buttonColor,
          border: Border.all(color: borderColor,width: borderWidth),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            SizedBox(
                width: sizeOfPrefixWidget,
                height: sizeOfPrefixWidget,
                child: prefixWidget),
            text!=null?
            Text('$text',style: TextStyle(
              fontSize: fontSizs,
              color: textColor,
              fontWeight: fontWeight,
            ),):
            SizedBox(
              width: sizeOfCenterWidget,
              height: sizeOfCenterWidget,
              child: centerWidget,
            ),
            SizedBox(
                width: sizeOfSuffixWidget,
                height: sizeOfSuffixWidget,
                child: suffixWidget),
          ],
        ),

      ),
    );
  }
}

class SimpleText extends StatelessWidget {
  String? text;
  double fontSize;
  FontWeight fontWeight;
  Color color;
  TextAlign? textAlign;
  bool isTextUnderLine, roboto;
  double padding;
  VoidCallback? onTap;

  SimpleText(this.text,
      {Key? key,
        this.fontSize = 16,
        this.fontWeight = FontWeight.w500,
        this.color = Colors.white,
        this.isTextUnderLine = false,
        this.roboto = false,
        this.onTap,
        this.padding = 0,
        this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    init(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Wrap(
          children: [
            Text(
              text!,
              textAlign: textAlign,
              style: roboto == true
                  ? GoogleFonts.roboto(
                  textStyle: TextStyle(
                      decoration: isTextUnderLine == true
                          ? TextDecoration.underline
                          : null,
                      color: color,
                      fontSize: width(fontSize),
                      fontWeight: fontWeight))
                  : GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: color,
                      decoration: isTextUnderLine == true
                          ? TextDecoration.underline
                          : null,
                      fontSize: fontSize,
                      fontWeight: fontWeight)),
            ),
          ],
        ),
      ),
    );
  }
}


class TextFieldClass extends StatefulWidget {
  FontWeight fontWeight;
  String? labelText, hintText;
  String? image;
  TextInputType? keyboardType;
  bool? obscureText;
  double padding;
  VoidCallback? onTap;
  bool dateField;
  TextEditingController? controller;
  String? yourInitialData;
  FocusNode? myFocusNode;
  bool isEmail, isFullname,isDropdown;
  String? email, name;
  bool labelTextBehaveAuto;

  // bool showpassword;
  // final VoidCallback onTap;

  TextFieldClass(
      {Key? key,
        this.labelText=' ', this.hintText=' ',
        this.isDropdown=false,
        this.image,
        this.labelTextBehaveAuto=false,
        this.padding = 0,
        this.keyboardType,
        this.obscureText = false,
        this.onTap = null,
        this.isEmail = false,
        this.isFullname = false,
        this.dateField = false,
        this.yourInitialData,
        this.myFocusNode,
        this.fontWeight = FontWeight.normal,
        this.controller})
      : super(key: key);

  @override
  State<TextFieldClass> createState() => _TextFieldClassState();
}

class _TextFieldClassState extends State<TextFieldClass> {
  @override
  Widget build(BuildContext context) {
    init(context);

    return Padding(
      padding: EdgeInsets.only(top: screenHeight * widget.padding),
      child: TextFormField(
        focusNode: widget.myFocusNode,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        readOnly: widget.dateField,
        cursorColor: Colors.white,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText!,
        // obscureText: true,
        obscuringCharacter: '*',
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
            )),
        initialValue: widget.yourInitialData,
        decoration: InputDecoration(
          filled: true,
          fillColor: textFieldColor,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          hintText: widget.hintText,
          floatingLabelBehavior:widget.labelTextBehaveAuto?FloatingLabelBehavior.auto: FloatingLabelBehavior.never,
          hintStyle: TextStyle(
            color:  Colors.white,
          ),
          contentPadding: EdgeInsets.only(top: 5),
          prefixIcon: InkWell(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child:widget.image!=null? SvgPicture.asset(widget.image!):SizedBox(),
            ),
          ),
          enabledBorder: myinputborder(), //enabled border
          focusedBorder: myfocusborder(), //focused border
          // enabledBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: textFieldColor),
          // ),
          // focusedBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: textFieldColor),
          // ),
        ),
        validator: (String? value) {
          if (widget.isEmail) {
            if (value!.isEmpty) {
              return 'Please enter your Email';
            }
            if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
              return 'Please enter a valid Email';
            }
          } else if (widget.isFullname) {
            if (value!.isEmpty) {
              return 'Please enter your Name';
            }
          }
          return null;
        },
        onSaved: (String? value) {
          if (widget.isFullname) {
            widget.name = value!;
          }
          if (widget.isEmail) {
            widget.email = value!;
          }
          return null;
        },
      ),
    );
  }

}

OutlineInputBorder myinputborder({isOffWhite=false}){ //return type is OutlineInputBorder
  return OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(27)),
      borderSide: BorderSide(
        color:isOffWhite? offWhite:textFieldColor,
        width: 3,
      )
  );
}

OutlineInputBorder myfocusborder({isOffWhite=false}){
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(27)),
      borderSide: BorderSide(
        color:isOffWhite?offWhite:textFieldColor,
        width: 3,
      )
  );
}
typedef void MyCallback(String value);

class DropDownMenu extends StatefulWidget {
  List<String> menuList;


  final MyCallback? callback;
  FontWeight fontWeight;
  String? initialValue, hintText;
  bool isExpanded;
  final textColor;
  final hintTextColor;
  final fieldColor;
  final dropDownColor;

  // bool showpassword;
  // final VoidCallback onTap;

  DropDownMenu(
      { this.callback,
        required this.menuList,
        this.textColor=Colors.black,
        this.hintTextColor=Colors.grey,
        this.fieldColor=Colors.white,
        this.dropDownColor=Colors.white,
        this.hintText,
        this.initialValue,
        this.isExpanded=true,
        this.fontWeight = FontWeight.normal});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    init(context);

    return Container(
      width: screenWidth,
      height: height(54),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width(27)),
        color: widget.fieldColor,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(20)),
          child: DropdownButton(
            icon: Icon(Icons.keyboard_arrow_down,color: widget.textColor,),
            borderRadius: BorderRadius.circular(width(27)),
            hint:widget.hintText!=null? Text(widget.hintText!,
              style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: widget.hintTextColor,
                fontSize: width(15),
                fontWeight: FontWeight.w400,

              ),
            ),):null,
            isExpanded: widget.isExpanded,
            isDense: true,
            dropdownColor: widget.dropDownColor,
            underline: SizedBox(),
            value: widget.initialValue,
            elevation: 8,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: widget.textColor,
                fontSize: width(15),
                fontWeight: FontWeight.w400,

              ),
            ),

            items: widget.menuList.map((String item) =>
                DropdownMenuItem<String>(
                    child: Text('       $item',
                    style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: widget.textColor,
                    fontSize: width(15),
                    fontWeight: FontWeight.w400,

                  ),
                ),),
                    value: item.trim()))
                .toList(),
            // hint: Text(
            //   "Please choose a langauage",
            //   style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w600),
            // ),
            onChanged: (value){
              setState(() {
                widget.initialValue=value.toString();
              });
              widget.callback!(value.toString());
            },
          ),
        ),
      ),
    );
  }

}