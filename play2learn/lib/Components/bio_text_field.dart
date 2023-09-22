import 'package:flutter/material.dart';

class BioTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;
  final Color color;
  final Function()? onTap;

  const BioTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 10,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder:  const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey[500]
          ),
          suffixIcon: IconButton(
            icon: icon,
            color: color,
            onPressed: onTap,
          )
      ),
    );
  }
}