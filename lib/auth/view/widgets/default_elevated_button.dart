import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  DefaultElevatedButton({required this.child,required this.onpressed});
  Widget child;
  void Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
      ),
        child: child,
    );
  }
}

