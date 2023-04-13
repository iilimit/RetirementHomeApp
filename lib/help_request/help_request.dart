import 'dart:core';
import 'dart:math';

class HelpRequest {
  int id = 0;
  String requesterName = "";
  DateTime? requestedAt;
  DateTime? fulfilledAt;
  String type = "";
  HelpRequest();

  HelpRequest.fromJson(Map<String, dynamic> json) {
   
    requesterName = json['requesterName'];
    requestedAt = json['requestedAt'];
    type = json['type'];
    fulfilledAt = json['fulfilledAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() => {'id': id, 'requesterName': requesterName, 'requestedAt': requestedAt, 'fulfilledAt': fulfilledAt, 'type': type};
}
