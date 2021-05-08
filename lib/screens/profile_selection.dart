import 'package:flutter/material.dart';

class ProfileSelection extends StatefulWidget {
  @override
  _ProfileSelectionState createState() => _ProfileSelectionState();
}

class _ProfileSelectionState extends State<ProfileSelection> {
  bool selectedShipper = false;
  bool selectedTransporter = false;

  void makeShipperProfile() {
    setState(() {
      selectedTransporter = false;
      selectedShipper = true;
    });
  }

  void makeTransporterProfile() {
    setState(() {
      selectedShipper = false;
      selectedTransporter = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final body = SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 75),
            Text(
              "Please select your profile",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 35),
            InkWell(
              onTap: () {
                makeShipperProfile();
              },
              child: Container(
                height: 100,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
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
                    selectedShipper
                        ? Icon(Icons.radio_button_checked)
                        : Icon(Icons.radio_button_off),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/shipper.png"),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shipper",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet,\nconsectetur adipiscing",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                makeTransporterProfile();
              },
              child: Container(
                height: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    selectedTransporter
                        ? Icon(Icons.radio_button_checked)
                        : Icon(Icons.radio_button_off),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/transporter.png"),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transporter",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet,\nconsectetur adipiscing",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
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
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
