class ChatModel {
  String name;
  String time;
  bool isGroup;
  String status;
  bool select = false;
  String currentMessage;
  String icon;
  int id;
  ChatModel({required this.name,required this.status,required this.icon,required this.time,required this.currentMessage,required this.isGroup,required this.id});
}