import 'package:annar_app/utils/contants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final IconData? icon;
  final TextEditingController textController;
  const CustomTextField(
      {super.key, this.labelText, this.icon, required this.textController});

  @override
  Widget build(BuildContext context) {

    ThemeData theme = Theme.of(context);



    return Padding(
      padding: const EdgeInsets.only(
          left: Const.paddingButton, right: Const.paddingButton),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
            labelText: labelText ?? '',
            suffixIcon: Icon(icon),
            suffixIconColor: theme.primaryColor,
            border: const OutlineInputBorder()),
      ),
    );
  }
}
