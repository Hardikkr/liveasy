import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/screens/mobile_number_001.dart';
import 'package:liveasy/screens/profile_selection.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyPhone extends StatelessWidget {
  VerifyPhone(this.phoneNumber);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    // final textBlock = FocusScope.of(context);
    String otp;

    void signInWithPhoneAuthCredential(
        PhoneAuthCredential phoneAuthCredential) async {
      try {
        final authCredential = await FirebaseAuth.instance
            .signInWithCredential(phoneAuthCredential);

        if (authCredential?.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileSelection(),
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        print(e.message);
      }
    }

    // Widget textField = Container(
    //   padding: const EdgeInsets.all(5),
    //   height: 45,
    //   width: 45,
    //   color: Color(0xff93D2F3),
    //   child: Center(
    //     child: TextField(
    //       onChanged: (str) {
    //         if (str.length == 1) {
    //           textBlock.nextFocus();
    //         }
    //       },
    //       textAlign: TextAlign.center,
    //       style: TextStyle(fontSize: 25),
    //       maxLength: 1,
    //       keyboardType: TextInputType.number,
    //       decoration: InputDecoration(
    //         counterText: "",
    //         border: InputBorder.none,
    //       ),
    //     ),
    //   ),
    // );

    final body = SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Verify Phone",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Code sent to $phoneNumber",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  // SizedBox(height: 15),
                  // Container(
                  //   height: 50,
                  //   padding: const EdgeInsets.symmetric(horizontal: 30),
                  //   width: double.infinity,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       textField,
                  //       textField,
                  //       textField,
                  //       textField,
                  //       textField,
                  //       textField,
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 15),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      child: OTPTextField(
                        length: 6,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 40,
                        fieldStyle: FieldStyle.underline,
                        style: TextStyle(fontSize: 25),
                        // onChanged: (pin) {
                        //   print("Changed: " + pin);
                        // },
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                          otp = pin;
                        },
                      )),
                  SizedBox(height: 15),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Didn't receive the code? ",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Request Again",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                            },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        PhoneAuthCredential phoneAuthCredential =
                            PhoneAuthProvider.credential(
                          verificationId: userVerificationId,
                          smsCode: otp,
                        );
                        signInWithPhoneAuthCredential(phoneAuthCredential);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ProfileSelection(),
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff2E3B62),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                        ),
                      ),
                      child: Text(
                        "VERIFY AND CONTINUE",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
