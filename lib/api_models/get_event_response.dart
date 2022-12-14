class GetEventResponse {
  int? timeStamp;
  String? eventType;
  String? location;
  String? eid;
  String? status;
  String? photoURL;
  String? organiserName;
  String? description;
  String? organiserID;
  String? title;
  bool? multipleDates;
  dynamic start;
  dynamic end;

  InvitedContacts? invitedContacts;
  QuestionForm? form;
  Params? params;

  GetEventResponse(
      {this.timeStamp,
        this.eventType,
        this.location,
        this.eid,
        this.status,
        this.photoURL,
        this.organiserName,
        this.description,
        this.organiserID,
        this.title,
        this.start, this.end});

  GetEventResponse.fromJson(Map<String, dynamic> json) {
    timeStamp = json['timeStamp'];
    eventType = json['eventType'];
    location = json['location'];
    eid = json['eid'];
    status = json['status'];
    photoURL = json['photoURL'];
    organiserName = json['organiserName'];
    description = json['description'];
    organiserID = json['organiserID'];
    title = json['title'];
    multipleDates = json['multipleDates'];
    start = json['start'];
    end = json['end'];
    invitedContacts = json['invitedContacts'] != null ? InvitedContacts(json['invitedContacts']) : null;
    form = json['form'] != null ? QuestionForm(json['form']) : null;
    params = json['params'] != null ? Params.fromJson(json['params']) : null;
  }
}

class InvitedContacts{
  List<String> keysList = [];
  List<String> valuesList = [];

  InvitedContacts(Map<String, dynamic> json){

    for (var key in json.keys) {
      keysList.add(key);
    }

    for (var value in json.values) {
      valuesList.add(value);
    }
  }
}

class QuestionForm{
  List<String> keysList = [];
  List<String> valuesList = [];

  QuestionForm(Map<String, dynamic> json){

    for (var key in json.keys) {
      keysList.add(key);
    }

    for (var value in json.values) {
      valuesList.add(value);
    }
  }
}

class Params{
  bool? attendanceVisibility;
  bool? photoAlbum;

  Params.fromJson(Map<String, dynamic> json){
    if(json['AttendanceVisibility'] != null){
      attendanceVisibility = json['AttendanceVisibility'];
    }
    if(json['photoAlbum'] != null){
      photoAlbum = json['photoAlbum'];
    }
  }
}


