import 'package:chatapp/views/constance.dart';

class Messages{
  final String message;
  final String id;
  Messages(this.message,this.id);
  factory Messages.fromjson(jsondata){
    return Messages(jsondata[kmessage],jsondata['id']);
  }
}