import 'package:chat/chat/data/models/message_model.dart';
import 'package:chat/chat/view_model/chat_states.dart';
import 'package:chat/models/user_model.dart';
import 'package:chat/shared/database_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatViewModel extends Cubit<ChatStates> {
  ChatViewModel() : super(ChatInitial());
  final messageController = TextEditingController();
  late final UserModel currentUser;
  late final String roomId;

  Future<void> sendMessages() async {
    if(messageController.text.isEmpty) return;
    emit(SendMessagesLoading());
    try {
      final messageContent = messageController.text;
      messageController.clear();
      await DataBaseUtils.insertMessageToRoom(MessageModel(
          content: messageContent,
          dateTime: DateTime.now(),
          senderId: currentUser.id,
          senderName: currentUser.name,
          roomId: roomId));
      emit(SendMessagesSuccess());
    } catch (error) {
      emit(SendMessagesError());
    }
  }

  void getMessagesStream() {
    emit(GetMessagesStreamLoading());
    try {
      final messagesStream = DataBaseUtils.getRoomMessages(roomId);
      emit(GetMessagesStreamSuccess(messagesStream));
    } catch (error) {
      emit(GetMessagesStreamError());
    }
  }

  bool isMyMessage(String messageId) => messageId == currentUser.id;
}
