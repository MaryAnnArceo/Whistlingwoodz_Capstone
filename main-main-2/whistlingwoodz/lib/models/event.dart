// Event entity (Parent class of Wedding, Corporate, and Party)
class Event {
  final String id;
  final String type;
  final String theme;
  final String function;
  final String venue;
  final String guestNo;
  final String budget;
  final String email;
  final String phoneNo;

  const Event({
    required this.id,
    required this.type,
    required this.theme,
    required this.function,
    required this.venue,
    required this.guestNo,
    required this.budget,
    required this.email,
    required this.phoneNo,
  });

  toJson() {
    return {
      "eid": id,
      "type": type,
      "theme": theme,
      "fundtion": function,
      "venue": venue,
      "guestNo": guestNo,
      "budget": budget,
      "email": email,
      "phoneNo": phoneNo,
    };
  }

// get methods for all the attributes of the event entity
  String get eventId {
    return id;
  }

  String get eventType {
    return type;
  }

  String get eventTheme {
    return theme;
  }

  String get eventFunction {
    return function;
  }

  String get eventVenue {
    return venue;
  }

  String get eventGuestNo {
    return guestNo;
  }

  String get eventBudget {
    return budget;
  }

  String get eventEmail {
    return email;
  }

  String get eventPhoneNo {
    return phoneNo;
  }
}
