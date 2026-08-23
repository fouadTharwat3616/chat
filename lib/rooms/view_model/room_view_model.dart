import 'package:chat/rooms/data/models/category_model.dart';
import 'package:chat/rooms/data/models/room_model.dart';
import 'package:chat/rooms/view_model/rooms_states.dart';
import 'package:chat/shared/database_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomViewModel extends Cubit<RoomsStates> {
  RoomViewModel() : super(RoomsInitial());
  List<RoomModel> rooms = [];

  Future<void> createRoom(RoomModel room) async {
    emit(CreateRoomLoading());
    try {
      await DataBaseUtils.createRoom(room);
      emit(CreateRoomSuccess());
    } catch (error) {
      emit(CreateRoomError(error.toString()));
    }
  }

  Future<void> getRooms() async {
    emit(GetRoomsLoading());
    try {
      rooms = await DataBaseUtils.getAllRooms();
      emit(GetRoomsSuccess());
    } catch (error) {
      emit(GetRoomsError(error.toString()));
    }
  }

  String getCategoryImageName(String categoryId) =>
   CategoryModel.categories
      .firstWhere((category) => category.id == categoryId)
      .imageName;
}
