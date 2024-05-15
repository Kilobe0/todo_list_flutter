import 'package:flutter/material.dart';

class SecondTextField extends StatefulWidget {
  const SecondTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.isPassword,
  });
  final String label;
  final TextEditingController controller;
  final bool isPassword;

  @override
  State<SecondTextField> createState() => _SecondTextFieldState();
}

class _SecondTextFieldState extends State<SecondTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
          suffixIcon: widget.isPassword
              ? GestureDetector(
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
