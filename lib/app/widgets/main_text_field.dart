import 'package:flutter/material.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    required this.isPassword,
  });
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final bool isPassword;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          isDense: true,
          constraints: const BoxConstraints(
            minWidth: 300,
            maxHeight: 50,
          ),
          labelText: widget.label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.transparent,
              style: BorderStyle.solid,
            ),
          ),
          icon: Icon(
            widget.icon,
          ),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null),
      obscureText: widget.isPassword ? isObscure : false,
      obscuringCharacter: '*',
    );
  }
}
