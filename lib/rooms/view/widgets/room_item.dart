import 'package:chat/chat/view/screens/chat_screen.dart';
import 'package:chat/rooms/data/models/room_model.dart';
import 'package:chat/rooms/view_model/room_view_model.dart';
import 'package:chat/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomItem extends StatelessWidget {
  const RoomItem(this.roomModel, {super.key});
  final RoomModel roomModel;



  @override
  Widget build(BuildContext context) {
    final displayTheme= Theme.of(context).textTheme.displaySmall;
    String categoryImageName = BlocProvider.of<RoomViewModel>(context).getCategoryImageName(roomModel.categoryId);
    return
      //Material(
     // elevation: 20,
     // borderRadius: BorderRadius.circular(16),
      // clipBehavior: Clip.antiAliasWithSaveLayer,
    //  child:
    InkWell(
      onTap: () => Navigator.of(context).pushNamed(ChatScreen.routeName,arguments: roomModel.id),
      child: Container(
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
                'assets/images/$categoryImageName.png',
                height: 85
              ),
              const SizedBox(height: 12,),
              Text(roomModel.name,style: displayTheme,),
              const SizedBox(height: 12,),
              Text(roomModel.description,style: displayTheme?.copyWith(
                fontSize: 12,
                color: AppTheme.greycolor,
                overflow: TextOverflow.ellipsis,
              ),
              textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
       // ),
      ),
    );
  }
}
