import 'package:chat/chat/data/models/message_model.dart';
import 'package:chat/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReceivedMessage extends StatelessWidget {
  final MessageModel messageModel;
  const ReceivedMessage(this.messageModel);

  @override
  Widget build(BuildContext context) {
    final displaySmall = Theme.of(context).textTheme.displaySmall;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(messageModel.senderName,
            style: displaySmall?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppTheme.greycolor
            )),
        const SizedBox(height: 4,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppTheme.greycolor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Text(
                  messageModel.content,
                  style: displaySmall?.copyWith(color: AppTheme.blackcolor),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              DateFormat.jm().format(messageModel.dateTime),
              style: displaySmall?.copyWith(fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }
}
