import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var textStyle = TextStyle(
    fontFamily: "IBM Plex Sans"
);

var fieldStyle = InputDecoration(
  filled: true,
  isDense: true,
  fillColor: Color(0xFFF8FAFC),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Appcolors.text_violet,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    ),
  ),
);

class Appcolors {
  static const Color blue = Color(0xff111827);
  static const Color text_white = Color(0xffFFFFFF);
  static const Color text_grey = Color(0xff9CA3AF);
  static const Color button_text_black = Color(0xff111827);
  static const Color button_white = Color(0xffFFFFFF);
  static const Color button_grey = Color(0xff4B5563);
  static const Color button_text_white = Color(0xffFFFFFF);
  static const Color button_blue = Color(0xff1877F2);
  static const Color text_violet = Color(0xff6a40f3);
  static const Color button_black = Color(0xff1c2431);
  static const Color background_blue = Color(0xff111827);
  static const Color background_blue1 = Color(0xff1C2431);
  static const Color profile_black = Color(0xff111827);

  static const Color signupButtoncolor = Color(0xff1C2431);
  static const Color signupButtonbordercolor = Color(0xff374151);
  static const Color orange = Color(0xffF24A4A);
  static const Color sky = Color(0xff7FE3F0);
  static const Color skgradiant = Color(0xff8C80F8);
  static const Color appbarcolor=Color(0xffFFFFFF);
  static const Color backgroundwhite = Color(0xffFFFFFF);
  static const Color textfieldColot=Color(0xffF8FAFC);
  static const Color textfieldTextColot=Color(0xff3B4256);
  static const Color signupsubmitButton=Color(0xff0048D9);
  static const Color signupsubmitButtontextcolor=Color(0xffFFFFFF);
  static const Color appbartextcolor=Color(0xff586472);
  static const Color signupheadertextcolor=Color(0xff586472);
  static const Color signuptextcolor=Color(0xff6F7482);

}

class Textstyle1 {

  static const TextStyle appbartextstyle = TextStyle(
      fontSize: 18,
      fontFamily: 'IBMPlexSans-Regular',
      color: Appcolors.appbartextcolor);
  static const TextStyle signupheadingText = TextStyle(
      fontSize: 25,
      fontFamily: 'IBMPlexSans-Regular',
      color: Appcolors.signupheadertextcolor);
  static const TextStyle signupText = TextStyle(
      fontSize: 14,
      fontFamily: 'IBMPlexSans-Regular',
      color: Appcolors.signuptextcolor);
  static const TextStyle Text18bold = TextStyle(
    fontWeight: FontWeight.bold,
      fontSize: 18,
      fontFamily: 'IBMPlexSans-Regular',
      color: Appcolors.button_black);
  static const TextStyle Text14 = TextStyle(
      fontSize: 14,
      fontFamily: 'IBMPlexSans-Regular',
      color: Appcolors.button_black);
  static const TextStyle Text16 = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      fontFamily: 'IBMPlexSans-Regular',
      color: Appcolors.button_black);
  static const TextStyle Text14bold = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      fontFamily: 'IBMPlexSans-Regular',
      color: Appcolors.button_black);

}

class Textfield1 {
  static TextFormField textFormField = TextFormField(
    style: TextStyle(color: Colors.white),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your name';
      }
      return null;
    },
    decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            gapPadding: 20,
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Appcolors.text_violet,
            )),
        errorBorder: OutlineInputBorder(
            gapPadding: 20,
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.red,
            )),
        isDense: true,
        filled: true,
        fillColor: Appcolors.signupButtoncolor,
        // prefixIcon: Container(
        //     padding: EdgeInsets.only(top: 18, bottom: 18),
        //     height: 60,
        //     child: Image.asset('assets/icons/Message.png')),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Appcolors.text_violet,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Appcolors.textfieldColot,
            )),
        hintText: 'Enter Name',
        hintStyle: TextStyle(color: Appcolors.text_grey, fontSize: 14)),
  );
  static InputDecoration inputdec =  InputDecoration(
      focusedBorder: OutlineInputBorder(
          gapPadding: 20,
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Appcolors.text_violet,
          )),
      errorBorder: OutlineInputBorder(
          gapPadding:00,
          //borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.red,
          )),
      isDense: true,
      filled: true,
      fillColor: Appcolors.textfieldColot,

      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Appcolors.textfieldColot,
        ),
        //borderRadius: BorderRadius.circular(12.0),
      ),
      enabledBorder: OutlineInputBorder(
        //borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Appcolors.textfieldColot,
          )
      ),
      hintText: 'Enter Name',
      hintStyle: TextStyle(color: Color(0xffB8BCCA), fontSize: 14));

}


class Boxdec{
  static  BoxDecoration bcgreyrad6=BoxDecoration(
      border: Border.all(color: Appcolors.button_grey),
      borderRadius: BorderRadius.circular(6),color: Appcolors.background_blue1);
  static  BoxDecoration b_backcvioletrad6=BoxDecoration(
      border: Border.all(color: Appcolors.text_violet),
      borderRadius: BorderRadius.circular(6),color: Appcolors.text_violet);
  static  BoxDecoration bcvioletrad6=BoxDecoration(
      border: Border.all(color: Appcolors.text_violet),
      borderRadius: BorderRadius.circular(6),color: Appcolors.background_blue1);
  static  BoxDecoration bcgreyrad12=BoxDecoration(
      border: Border.all(color: Appcolors.button_grey),
      borderRadius: BorderRadius.circular(12),color: Appcolors.background_blue1);
  static  BoxDecoration bcbluerad6=BoxDecoration(
      border: Border.all(color: Appcolors.background_blue1),
      borderRadius: BorderRadius.circular(6),color: Appcolors.background_blue);
}


