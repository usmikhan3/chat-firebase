import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomModel {
  String? chatRoomId;
  Map<String, dynamic>? participants;
  String? lastMessage;
  List<dynamic>? users;
  Timestamp? createdOn;

  ChatRoomModel(
      {this.chatRoomId,
      this.participants,
      this.lastMessage,
      this.users,
      this.createdOn});

  ChatRoomModel.fromMap(Map<String, dynamic> map) {
    chatRoomId = map["chatRoomId"];
    participants = map["participants"];
    lastMessage = map["lastMessage"];
    users = map["users"];
    createdOn = map["createdOn"];
  }

  Map<String, dynamic> toMap() {
    return {
      "chatRoomId": chatRoomId,
      "participants": participants,
      "lastMessage": lastMessage,
      "users": users,
      "createdOn": createdOn,
    };
  }
}
