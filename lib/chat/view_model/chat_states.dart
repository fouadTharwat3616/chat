import 'package:chat/chat/data/models/message_model.dart';

abstract class ChatStates{}

class ChatInitial extends ChatStates{}

class SendMessagesLoading extends ChatStates{}
class SendMessagesError extends ChatStates{}
class SendMessagesSuccess extends ChatStates{}



class GetMessagesStreamLoading extends ChatStates{}
class GetMessagesStreamError extends ChatStates{}
class GetMessagesStreamSuccess extends ChatStates{
  Stream<List<MessageModel>> messagesStream;
  GetMessagesStreamSuccess(this.messagesStream);
}

