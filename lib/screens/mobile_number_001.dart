import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/screens/verify_phone.dart';

var userVerificationId;

class MobileNumber001 extends StatefulWidget {
  @override
  _MobileNumber001State createState() => _MobileNumber001State();
}

class _MobileNumber001State extends State<MobileNumber001> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final body = SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.close),
              SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Please enter your mobile number",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "You'll receive a 4 digit code\nto verify next.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  SizedBox(height: 35),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 30,
                          child: Image.asset("assets/indian-flag.png"),
                        ),
                        Text(
                          "    +91    -    ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: phoneNumberController,
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Mobile Number",
                              border: InputBorder.none,
                              counterText: "",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '+91' + phoneNumberController.text,
                          verificationCompleted:
                              (AuthCredential phoneAuthCredential) async {
                            print("verificationCompleted");
                          },
                          verificationFailed:
                              (FirebaseAuthException firebaseAuthException) {
                            print("verificationFailed");
                            print("${firebaseAuthException.message}");
                          },
                          codeSent: (String verificationId, [int forceResend]) {
                            userVerificationId = verificationId;
                            print("codeSent");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyPhone(
                                    "${phoneNumberController.text}"),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
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
                        "CONTINUE",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
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
