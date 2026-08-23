import 'package:chat/chat/data/models/message_model.dart';
import 'package:chat/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SentMessage extends StatelessWidget {
  final MessageModel messageModel;
  const SentMessage(this.messageModel);

  @override
  Widget build(BuildContext context) {
    final displaySmall = Theme.of(context).textTheme.displaySmall;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(DateFormat.jm().format(messageModel.dateTime),style: displaySmall?.copyWith(
            fontSize: 15
        ),),
        const SizedBox(width: 20,),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: AppTheme.primaruColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child:  Text(messageModel.content,style: displaySmall?.copyWith(
                color: AppTheme.whitecolor
            ),
            ),
          ),
        ),

      ],
    );
  }
}
