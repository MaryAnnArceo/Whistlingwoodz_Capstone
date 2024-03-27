import 'package:cloud_firestore_platform_interface/src/timestamp.dart';

// Survey entity
class Survey {
  final String id;
  final String message;
  Timestamp timeStamp;
  Survey({
    required this.id,
    required this.message,
    required this.timeStamp,
  });

  toJson() {
    return {
      "id": id,
      "message": message,
      'timeStamp': timeStamp,
    };
  }

// get methods for all the attributes of the survey entity
  String get eventId {
    return id;
  }

  String get getMessage {
    return message;
  }
}
