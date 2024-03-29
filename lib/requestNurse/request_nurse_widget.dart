import 'package:flutter/material.dart';

import '../help_request/help_request.dart';

// ignore: camel_case_types
class requestNurse{
  static String? requestType;
}


void requestNurseAlertDialog(BuildContext context) {
  
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  Widget continue2Button = TextButton(
    child: const Text("Non-Emergency"),
    onPressed: () {
      Navigator.of(context).pop();
      requestNurseConfirmationAlertDialog(context);
      requestNurse.requestType = "Other";
    },
  );

  Widget continueButton = TextButton(
    child: const Text("Emergency"),
    onPressed: () {
      Navigator.of(context).pop();
      requestNurseConfirmationAlertDialog(context);
      requestNurse.requestType = "Medical";
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Request nurse"),
    content: const Text("Select a option"),
    actions: [
      cancelButton,
      continue2Button,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void requestNurseConfirmationAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Confirmed"),
    content: const Text("A nurse will be with you shortly!"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

    _addHelpRequest(){
    HelpRequest request = new HelpRequest();
    request.type = requestNurse.requestType!;
  }
}
