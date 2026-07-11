import 'package:chat/auth/view/widgets/custom_text_form_field.dart';
import 'package:chat/auth/view/widgets/default_elevated_button.dart';
import 'package:chat/rooms/data/models/room_model.dart';
import 'package:chat/rooms/view/widgets/category_dropdown_button.dart';
import 'package:chat/rooms/view_model/room_view_model.dart';
import 'package:chat/rooms/view_model/rooms_states.dart';
import 'package:chat/shared/app_theme.dart';
import 'package:chat/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateRoomScreen extends StatefulWidget {
  static const String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final nameController= TextEditingController();
  String? selectedRoom;
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final viewModel = RoomViewModel();
  @override
  Widget build(BuildContext context) {
    final displayTheme= Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        resizeToAvoidBottomInset:false,
        extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text('Chat App'),
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Material(
                            elevation: 20,
                             borderRadius: BorderRadius.circular(16),
                             clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              padding: const EdgeInsets.only(
                                right: 16,
                                left: 16,
                                top: 36
                              ),
                              height: MediaQuery.of(context).size.height*.8,
                              decoration: BoxDecoration(
                                color: AppTheme.whitecolor
                              ),
                              child: Column(
                                //mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                Text('Create New Room',style: displayTheme.bodySmall,),
                                    const SizedBox(height: 24,),
                                    Image.asset(
                                      'assets/images/room.png',
                                      height: MediaQuery.of(context).size.height*.1,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 24,),
                                    CustomTextFormField(
                                      controller: nameController,
                                      hintText: 'Enter Room Name',
                                      validator: (value) {
                                        if(value == null || value.length < 3) {
                                          return 'Name can not be less than 3 characters';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 24,),
                                    CategoryDropDownButton(
                                      onRoomSelected: (value) => selectedRoom=value,
                                    ),
                                    const SizedBox(height: 24,),
                                    CustomTextFormField(
                                        controller: descriptionController,
                                      hintText: 'Enter Room Description',
                                      maxLines: 5,
                                      validator: (value) {
                                        if(value == null || value.length < 5) {
                                          return 'Description can not be less than 5 characters';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 40,),
                                    BlocListener<RoomViewModel,RoomsStates>(
                                      listener: (_, state) {
                                        if (state is CreateRoomLoading)
                                          {
                                            UiUtils.showLoading(context);
                                          }
                                        else if(state is CreateRoomSuccess)
                                          {
                                            UiUtils.hideLoading(context);
                                            UiUtils.showMessage('Room Created Successfully');
                                            Navigator.of(context).pop();
                                          }
                                        else if (state is CreateRoomError)
                                          {
                                            UiUtils.hideLoading(context);
                                            UiUtils.showMessage(state.message);
                                          }
                                      },
                                      child: DefaultElevatedButton(
                                        width:  MediaQuery.of(context).size.width*.7,
                                        radiusValue: 32,
                                       onpressed: createRoom,
                                        child: Text('Create',style: displayTheme.bodySmall?.copyWith(
                                          color: AppTheme.whitecolor
                                        ),)
                                      ),
                                    )
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              )
          )
      ),
    );
  }



  void createRoom()
  {
    if(formKey.currentState?.validate()==true)
      {
        viewModel.createRoom(
            RoomModel(
                name: nameController.text,
                description: descriptionController.text,
                categoryId: selectedRoom!
            )
        );
      }
  }
}
