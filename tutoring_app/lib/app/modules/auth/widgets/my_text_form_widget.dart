import 'package:flutter/material.dart';
import 'package:tutoring_app/app/core/extentions/my_extention.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.textEditingController,
      required this.myFocusNode,
      required this.myTextInputAction,
      required this.labelText,
      required this.prefixIcon,
      this.suffixIcon,
      this.togglePassword,
      required this.obscureText,
      required this.onChanged,
      this.validator});
  final TextEditingController textEditingController;
  final FocusNode myFocusNode;
  final TextInputAction myTextInputAction;
  final String labelText;
  final Icon prefixIcon;
  final Icon? suffixIcon;
  final Function()? togglePassword;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.07,
      child: TextFormField(
        controller: textEditingController,
        focusNode: myFocusNode,
        textInputAction: myTextInputAction,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(labelText),
          prefixIcon: prefixIcon,
          suffix: IconButton(
            onPressed: togglePassword,
            icon: suffixIcon ?? SizedBox(),
          ),
        ),
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
