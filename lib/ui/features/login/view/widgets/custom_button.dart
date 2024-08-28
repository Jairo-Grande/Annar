import 'package:annar_app/utils/contants.dart';
import 'package:flutter/material.dart';

class CUstomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  const CUstomButton({super.key, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(Screens.width(context) / 2, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Const.borderRadiusButton),
        ),
      ),
      child: Text(
        'Ingresar',
        style: TextStyle(color: theme.colorScheme.onPrimary),
      ),
    );
  }
}
