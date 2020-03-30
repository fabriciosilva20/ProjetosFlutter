import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function(String) submit;
  final String label;

  AdaptativeTextField({
    this.controller,
    this.textInputType: TextInputType.text,
    this.submit,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: textInputType,
              onSubmitted: (_) => submit,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: textInputType,
            onSubmitted: (_) => submit,
            decoration: InputDecoration(labelText: label),
          );
  }
}
