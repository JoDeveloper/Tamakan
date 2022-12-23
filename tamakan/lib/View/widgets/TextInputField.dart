import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String myLabelText;
  final String myHintText;

  //final IconData myIcon;
  final bool obsecure;
  final String? Function(String?)? validator;
  final Function? onCallBack;

  TextInputField(
      {Key? key,
      required this.controller,
      required this.myLabelText,
      required this.myHintText,
      this.validator,
      this.onCallBack,

      //required this.myIcon,
      this.obsecure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: const EdgeInsets.only(right: 1, left: 250),
          child: TextFormField(
            obscureText: obsecure,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                //ENABLED BORDER: NOT CLICKED BY USER YET
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(115, 60, 69, 69)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                //FOCUSED BORDER: CLICKED BY USER
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFF6B6B), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: myHintText,
                //labelText: myLabelText,
                //icon: Icon(myIcon),
                hintTextDirection: TextDirection.rtl,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
          ),
        ));
  }
}
