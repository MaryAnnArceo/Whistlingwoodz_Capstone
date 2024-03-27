// Inquiry entity
class Inquiry {
  final String id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String eventType;
  final String message;

  const Inquiry({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.eventType,
    required this.message,
  });

  toJson() {
    return {
      "iid": id,
      "fullName": fullName,
      "email": email,
      "phoneNo": phoneNo,
      "eventType": eventType,
      "message": message,
    };
  }

// get methods for all the attributes of the inquiry entity
  String get inquiryId {
    return id;
  }

  String get name {
    return fullName;
  }

  String get userEmail {
    return email;
  }

  String get userPhoneNo {
    return phoneNo;
  }

  String get userEventType {
    return eventType;
  }

  String get userMessage {
    return message;
  }
}
