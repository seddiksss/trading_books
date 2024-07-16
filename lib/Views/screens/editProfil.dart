import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Core/Constants/AppColor.dart';
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
            height: screenheight * 0.19,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.black)),
            child: Image.asset(
              "assets/images/shape2.png",
            ),
          ),
          const Row(
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
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.only(left: 9, right: 9),
              child: const Profiltextfield(
                hint: "Adress",
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.only(left: 9, right: 9),
              child: const Profiltextfield(
                hint: "City",
              )),
          const SizedBox(
            height: 20,
          ),
          const Row(
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
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.only(left: 9, right: 9),
              child: const Profiltextfield(
                hint: "Phone number",
              )),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: AppColor.primarycolor,
                  onPressed: () {},
                  child:
                      Text("Cancel", style: TextStyle(color: AppColor.black)),
                ),
                SizedBox(
                  width: screenwidth * 0.04,
                  height: screenheight * 0.10,
                ),
                MaterialButton(
                  color: AppColor.primarycolor,
                  onPressed: () {},
                  child: Text("Save", style: TextStyle(color: AppColor.black)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
