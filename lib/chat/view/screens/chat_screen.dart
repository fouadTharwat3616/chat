import 'package:chat/auth/view_model/auth_view_model.dart';
import 'package:chat/chat/data/models/message_model.dart';
import 'package:chat/chat/view/widgets/received_message.dart';
import 'package:chat/chat/view/widgets/sent_message.dart';
import 'package:chat/chat/view_model/chat_states.dart';
import 'package:chat/chat/view_model/chat_view_model.dart';
import 'package:chat/shared/app_theme.dart';
import 'package:chat/shared/widgets/error_indicator.dart';
import 'package:chat/shared/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final viewModel = ChatViewModel();
  List<MessageModel> messages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.roomId = ModalRoute.of(context)?.settings.arguments as String;
      viewModel.getMessagesStream();
      viewModel.currentUser =
          BlocProvider.of<AuthViewModel>(context).currentUser!;
    });
  }
  /*
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();


  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Chat App'),
          forceMaterialTransparency: true,
        ),
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill)),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .03),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding:  EdgeInsets.only(left: 16,right: 16,top: MediaQuery.of(context).size.height*.1),
                            child: Material(
                                elevation: 20,
                                borderRadius: BorderRadius.circular(16),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      right: 16, left: 16, top: 36),
                                  height: MediaQuery.of(context).size.height * .8,
                                  decoration:
                                      BoxDecoration(color: AppTheme.whitecolor),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: BlocBuilder<ChatViewModel,
                                                ChatStates>(
                                            buildWhen: (previousState,
                                                    currentState) =>
                                                previousState
                                                    is GetMessagesStreamLoading ||
                                                currentState
                                                    is GetMessagesStreamLoading,
                                            bloc: viewModel,
                                            builder: (context, state) {
                                              if (state
                                                  is GetMessagesStreamLoading) {
                                                return const LoadingIndicator();
                                              } else if (state
                                                  is GetMessagesStreamError) {
                                                return const ErrorIndicator();
                                              } else if (state
                                                  is GetMessagesStreamSuccess) {
                                                return StreamBuilder(
                                                    stream: state.messagesStream,
                                                    builder: (context, snapshot) {
                                                     if(snapshot.hasData)
                                                       {
                                                         messages = snapshot.data!.reversed.toList();
                                                       }
                                                      return ListView.separated(
                                                        itemBuilder:
                                                            (context, index) {
                                                          final message =
                                                              messages[index];
                                                          final myMessage =
                                                              viewModel.isMyMessage(
                                                                  message
                                                                      .senderId);
                                                          if (myMessage) {
                                                            return SentMessage(
                                                                message);
                                                          } else {
                                                            return ReceivedMessage(
                                                                message);
                                                          }
                                                        },
                                                        itemCount:
                                                            messages.length,
                                                        padding: EdgeInsets.zero,
                                                        reverse: true,
                                                        separatorBuilder:
                                                            (context, index) =>
                                                                const SizedBox(
                                                          height: 12,
                                                        ),
                                                      );
                                                    });
                                              } else {
                                                return const SizedBox();
                                              }
                                            }),
                                      ),
                                      const SizedBox(height: 12,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller:
                                                  viewModel.messageController,
                                              decoration: InputDecoration(
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              AppTheme.greycolor),
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                              topRight:
                                                                  Radius.circular(
                                                                      12))),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              AppTheme.greycolor),
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                              topRight:
                                                                  Radius.circular(
                                                                      12))),
                                                  hintText: 'Type a message',
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 8)),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppTheme.primaruColor,
                                                foregroundColor:
                                                    AppTheme.whitecolor,
                                                fixedSize: const Size(95, 50),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8))),
                                            onPressed: () {
                                              viewModel.sendMessages();
                                            },
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('send'),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.send,
                                                  size: 18,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                )))
                      ]),
                ))));
  }
}
