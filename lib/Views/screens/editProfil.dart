import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Views/widgets/profilTextfield.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenwidth = mediaQuery.size.width;
    final screenheight = mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Color.fromARGB(255, 87, 85, 85)),
                    )),
                SizedBox(width: screenwidth * 0.57),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: TextStyle(color: Color.fromARGB(255, 87, 85, 85)),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: screenheight * 0.19,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black)),
            child: Image.asset(
              "assets/images/shape2.png",
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 9,
              ),
              Profiltextfield(
                hint: "First name",
              ),
              SizedBox(
                width: 20,
              ),
              Profiltextfield(
                hint: "Last name",
              ),
              SizedBox(
                width: 9,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 9, right: 9),
              child: Profiltextfield(
                hint: "Adress",
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 9, right: 9),
              child: Profiltextfield(
                hint: "City",
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 9,
              ),
              Profiltextfield(
                hint: "State",
              ),
              SizedBox(
                width: 20,
              ),
              Profiltextfield(
                hint: "Zip Code",
              ),
              SizedBox(
                width: 9,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 9, right: 9),
              child: Profiltextfield(
                hint: "Phone number",
              )),
        ],
      ),
    );
  }
}
