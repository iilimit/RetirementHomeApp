import 'package:flutter/material.dart';

void requestNurseAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Yes"),
    onPressed: () {
      Navigator.of(context).pop();
      requestNurseEmergencyAlertDialog(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Request nurse"),
    content: const Text("Would you like to request a nurse?"),
    actions: [
      cancelButton,
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

void requestNurseEmergencyAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget noButton = TextButton(
    child: const Text("No"),
    onPressed: () {
      Navigator.of(context).pop();
      requestNurseConfirmationAlertDialog(context);
    },
  );
  Widget yesButton = TextButton(
    child: const Text("Yes"),
    onPressed: () {
      Navigator.of(context).pop();
      requestNurseConfirmationAlertDialog(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Confirm request..."),
    content: const Text("Is this an emergency?"),
    actions: [
      cancelButton,
      noButton,
      yesButton,
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
}
