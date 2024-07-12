import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(158, 158, 158, 0.231),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                margin: const EdgeInsets.only(left: 7.0, right: 7.0),
                padding: const EdgeInsets.only(left: 12.0, right: 5.0),
                child: Align(
                  alignment: Alignment.center,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: (value) {},
                  ),
                ),
              ),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 550,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 340,
                        ),
                        const Text(
                          " A NEW \n AND EASY \n WAY TO ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 26.0,
                              letterSpacing: 4,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            print("click button");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              "EXCHANGE YOUR BOOKS",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "NEW ARRIVAL",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Divider(
                    height: 1.0,
                    endIndent: 120,
                    indent: 120,
                    color: Colors.black),
              ],
            ),
          ),
        ));
  }
}
