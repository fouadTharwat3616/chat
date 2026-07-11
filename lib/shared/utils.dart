import 'package:chat/shared/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class UiUtils {
 static void showLoading(BuildContext context) =>
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              AlertDialog(
                //contentPadding:EdgeInsets.all(MediaQuery.of(context).size.height*.01) ,
                content: SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .2,
                  child:  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     LoadingIndicator()
                    ],
                  ),
                ),
              )
      );
 static void hideLoading(BuildContext context)=> Navigator.of(context).pop();
 static void showMessage(String message)=>
     Fluttertoast.showToast(
         msg: message,
         toastLength: Toast.LENGTH_SHORT
     );
}