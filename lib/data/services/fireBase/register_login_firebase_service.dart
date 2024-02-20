// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
//
// class RegistorLoginFirebaseService{
//
//   // registorUser(String otp)async{
//   //   final AuthCredential authCredential=PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otp);
//   // }
//   String ?phoneNumber;
//   String ?verificationId;
//   String ?otp, authStatus = "";
//   Future<void> verifyPhoneNumber(BuildContext context) async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       timeout: const Duration(seconds: 15),
//       verificationCompleted: (AuthCredential authCredential) {
//
//
//       },
//       // verificationFailed: (AuthException authException) {
//       //
//       // },
//       // codeSent: (String verId, [int forceCodeResent]) {
//       //   verificationId = verId;
//       //   setState(() {
//       //     authStatus = "OTP has been successfully send";
//       //   });
//       //   otpDialogBox(context).then((value) {});
//       // },
//       // codeAutoRetrievalTimeout: (String verId) {
//       //   verificationId = verId;
//       //   setState(() {
//       //     authStatus = "TIMEOUT";
//       //   });
//       },
//     );
//   }
// }