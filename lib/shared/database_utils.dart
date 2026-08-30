import 'package:chat/chat/data/models/message_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:chat/rooms/data/models/room_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseUtils {
  static CollectionReference<UserModel> getUsersCollection() =>
      FirebaseFirestore.instance.collection('Users').withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (userModel, _) => userModel.toJson(),
          );

  static CollectionReference<RoomModel> getRoomsCollection() =>
      FirebaseFirestore.instance.collection('rooms').withConverter<RoomModel>(
            fromFirestore: (snapshot, _) =>
                RoomModel.fromJson(snapshot.data()!),
            toFirestore: (roomModel, options) => roomModel.toJSon(),
          );
  static CollectionReference<MessageModel> getMessagesCollection(
          String roomId) =>
      getRoomsCollection()
          .doc(roomId)
          .collection('messages')
          .withConverter<MessageModel>(
            fromFirestore: (snapshot, _) =>
                MessageModel.fromJson(snapshot.data()!),
            toFirestore: (MessageModel, options) => MessageModel.toJson(),
          );

  static Future<UserModel> Register({
    required String name,
    required String email,
    required String password,
  }) async {
    final credentials = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final user = UserModel(
        //firebase User
        id: credentials.user!.uid,
        name: name,
        email: email);
    final userCollection = getUsersCollection();
    await userCollection.doc(user.id).set(user);
    return user;
  }

  static Future<UserModel> Login({
    required String email,
    required String password,
  }) async {
    final credentials = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final user = _getUser(credentials.user!.uid);
    return user;
  }

  static Future<void> LogOut() {
    return FirebaseAuth.instance.signOut();
  }
  static Future<UserModel> _getUser(String id)async
  {
    final userCollection = getUsersCollection();
    final docSnapshot = await userCollection.doc(id).get();
    return docSnapshot.data()!;
  }

  static Future<UserModel?> getCurrentUser()async{
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser == null) return null;
    final user = _getUser(firebaseUser.uid);
    return user;
  }

  //Create room
  static Future<void> createRoom(RoomModel room) async {
    final roomsCollection = getRoomsCollection();
    final doc = roomsCollection.doc();
    room.id = doc.id;
    return doc.set(room);
  }

  //get all rooms
  static Future<List<RoomModel>> getAllRooms() async {
    final roomsCollection = getRoomsCollection();
    final querySnapshot = await roomsCollection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  static Future<void> insertMessageToRoom(MessageModel message) async {
    final messagesCollection = getMessagesCollection(message.roomId);
    final doc = messagesCollection.doc();
    message.id = doc.id;
    return doc.set(message);
  }

  static Stream<List<MessageModel>> getRoomMessages(String roomId) {
    final messagesCollection = getMessagesCollection(roomId);
   return messagesCollection.orderBy('dateTime').snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((doc) => doc.data()).toList());
  }
}
