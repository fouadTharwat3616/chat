import 'package:chat/rooms/view/screens/create_room_screen.dart';
import 'package:chat/rooms/view/widgets/room_item.dart';
import 'package:chat/shared/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.whitecolor,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Chat App',
          ),
        ),
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill)),
            child: Padding(
                padding: const EdgeInsets.only(
                     left: 16,
                  right: 16,
                  top: 32
                ),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16
                    ),
                    itemBuilder: (context, index) =>  const RoomItem(),
                  itemCount: 6,
                )
            )
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CreateRoomScreen.routeName);
        },
        child: const Icon(
          Icons.add,
          size: 36,
        ),
      ),
    );
  }
}
