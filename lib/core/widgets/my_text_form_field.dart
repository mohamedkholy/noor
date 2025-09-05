import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noor/core/theming/my_colors.dart';
import 'package:noor/core/theming/my_text_styles.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  const MyTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        counter: const SizedBox.shrink(),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),

        focusedBorder: _buildBorder(MyColors.primary),
        enabledBorder: _buildBorder(Colors.grey.shade300),
        errorBorder: _buildBorder(Colors.red),
        focusedErrorBorder: _buildBorder(Colors.red),
        hintText: hintText,
        hintStyle: MyTextStyles.font15RegularGrey,
      ),
      controller: controller,
      validator: validator,
    );
  }

  InputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
