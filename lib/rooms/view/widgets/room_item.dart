import 'package:chat/shared/app_theme.dart';
import 'package:flutter/material.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({super.key});

  @override
  Widget build(BuildContext context) {
    final displayTheme= Theme.of(context).textTheme.displaySmall;
    return
      //Material(
     // elevation: 20,
     // borderRadius: BorderRadius.circular(16),
      // clipBehavior: Clip.antiAliasWithSaveLayer,
    //  child:
    Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.whitecolor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppTheme.greycolor.withOpacity(.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0,3)
            )
          ]
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/movies.png',
              height: 85
            ),
            const SizedBox(height: 12,),
            Text('The Movies Zone',style: displayTheme,),
            const SizedBox(height: 12,),
            Text('13 Members',style: displayTheme?.copyWith(
              fontSize: 12,
              color: AppTheme.greycolor
            ),),
          ],
        ),
     // ),
    );
  }
}
