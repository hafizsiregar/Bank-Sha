import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomForm extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final TextInputType? keyboardType;

  const CustomForm({
    required this.title,
    this.obscureText = false,
    this.controller,
    this.isShowTitle = true,
    this.keyboardType,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if(isShowTitle)
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        ),
        if(isShowTitle)
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: !isShowTitle ? title : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              contentPadding: EdgeInsets.all(12)),
        ),
      ],
    );
  }
}
