abstract class RoomsStates{}

class RoomsInitial extends RoomsStates{}


class CreateRoomLoading extends RoomsStates{}
class CreateRoomSuccess extends RoomsStates{}
class CreateRoomError extends RoomsStates{
  String message;
  CreateRoomError(this.message);
}


class GetRoomsLoading extends RoomsStates{}
class GetRoomsSuccess extends RoomsStates{}
class GetRoomsError extends RoomsStates{
  String message;
  GetRoomsError(this.message);
}