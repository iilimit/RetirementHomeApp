import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'help_request.dart';

class HelpRequestRepository {
  var httpStatusCodes = <int, String>{
    405: "This operation is not supported.",
    500: "Server encoutered issues.",
    201: "New resource created",
    404: "resource does not exist"
  };
  Future<List<HelpRequest>> getAllRequest() async {
    try {
      var url = Uri.parse("http://localhost:8080/api/v1/helpme/");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Iterable requestListiterablejson = jsonDecode(response.body);
        List<HelpRequest> requestList = List<HelpRequest>.from(
            requestListiterablejson.map((data) => HelpRequest.fromJson(data)));
        //.toList();
        //log(clist.length.toString());
        return requestList;
      }
    } catch (e) {
      log("Error: $e");
    }
    return [];
  }

Future<HelpRequest> addHelpRequest(HelpRequest request) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/api/v1/helpme/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request.toJson()),
    );
    //log("Response: $response.body");
    return HelpRequest.fromJson(jsonDecode(response.body));
  }
}
