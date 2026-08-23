import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  DefaultElevatedButton({required this.child,required this.onpressed,this.radiusValue=6, this.width});
  Widget child;
  void Function() onpressed;
  final double radiusValue;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        fixedSize: Size(width ?? MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusValue))
      ),
        child: child,
    );
  }
}

