import 'package:flutter/material.dart';

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
    },
  );

  Widget continueButton = TextButton(
    child: const Text("Emergency"),
    onPressed: () {
      Navigator.of(context).pop();
      requestNurseConfirmationAlertDialog(context);
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

// void requestNurseEmergencyAlertDialog(BuildContext context) {
//   Widget cancelButton = TextButton(
//     child: const Text("Cancel"),
//     onPressed: () {
//       Navigator.of(context).pop();
//     },
//   );
//   Widget noButton = TextButton(
//     child: const Text("No"),
//     onPressed: () {
//       Navigator.of(context).pop();
//       requestNurseConfirmationAlertDialog(context);
//     },
//   );
//   Widget yesButton = TextButton(
//     child: const Text("Yes"),
//     onPressed: () {
//       Navigator.of(context).pop();
//       requestNurseConfirmationAlertDialog(context);
//     },
//   );

//   AlertDialog alert = AlertDialog(
//     title: const Text("Confirm request..."),
//     content: const Text("Is this an emergency?"),
//     actions: [
//       cancelButton,
//       noButton,
//       yesButton,
//     ],
//   );

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

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
