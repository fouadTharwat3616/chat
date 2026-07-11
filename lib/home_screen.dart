import 'package:chat/rooms/view/screens/create_room_screen.dart';
import 'package:chat/rooms/view/widgets/room_item.dart';
import 'package:chat/rooms/view_model/room_view_model.dart';
import 'package:chat/rooms/view_model/rooms_states.dart';
import 'package:chat/shared/app_theme.dart';
import 'package:chat/shared/widgets/error_indicator.dart';
import 'package:chat/shared/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final viewModel = RoomViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getRooms();
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: AppTheme.whitecolor,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'Chat App',
          ),
        ),
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill)),
            child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
                child: BlocBuilder<RoomViewModel, RoomsStates>(
                  builder: (context, state) {
                    if (state is GetRoomsLoading) {
                      return const LoadingIndicator();
                    } else if (state is GetRoomsError) {
                      return ErrorIndicator(state.message);
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16),
                        itemBuilder: (context, index) =>
                            RoomItem(viewModel.rooms[index]),
                        itemCount: viewModel.rooms.length,
                      );
                    }
                  },
                ))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed(CreateRoomScreen.routeName)
                .then((_) => viewModel.getRooms());
          },
          child: const Icon(
            Icons.add,
            size: 36,
          ),
        ),
      ),
    );
  }
}
