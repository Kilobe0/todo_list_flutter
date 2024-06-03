import 'package:flutter/material.dart';

class MainTextField extends StatefulWidget {
  const MainTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.icon,
      required this.isPassword,
      this.maxLines = 1});
  final String label;
  final TextEditingController controller;
  final IconData? icon;
  final bool isPassword;
  final int maxLines;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 30, top: 18, bottom: 18),
          isDense: true,
          labelText: widget.label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.transparent,
              style: BorderStyle.solid,
            ),
          ),
          icon: widget.icon != null
              ? Icon(
                  widget.icon,
                )
              : null,
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                )
              : null),
      obscureText: widget.isPassword ? isObscure : false,
      obscuringCharacter: '*',
    );
  }
}
