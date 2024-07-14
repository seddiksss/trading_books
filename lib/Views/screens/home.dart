import 'package:flutter/material.dart';
import 'package:trading_books/Views/widgets/bookCardHome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 10,
          toolbarHeight: 120,
          title: TextFormField(
            focusNode: focusNode,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              filled: true,
              suffixIcon: Icon(Icons.search),
              hintText: 'Search',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none)),
            ),
            onFieldSubmitted: (value) {},
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: ListView(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 550,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/home.png'),
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
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                              ),
                            ],
                            fontSize: 26.0,
                            letterSpacing: 4,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 210, 205, 200)),
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
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "NEW ARRIVAL",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const Divider(
                  height: 1.0,
                  endIndent: 120,
                  indent: 120,
                  color: Colors.black),
              const SizedBox(
                height: 12,
              ),
              GridView.count(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    BookCardHome(
                      onTap: () {},
                      color: Colors.blueAccent,
                      picture: "assets/images/book2.png",
                      title: "ANNUAL REPORT",
                      prix: "120 DH",
                    ),
                    BookCardHome(
                      color: Colors.blueAccent,
                      picture: "assets/images/book2.png",
                      title: "ANNUAL REPORT",
                      prix: "120 DH",
                      onTap: () {},
                    ),
                    BookCardHome(
                      color: Colors.blueAccent,
                      picture: "assets/images/book2.png",
                      title: "ANNUAL REPORT",
                      prix: "120 DH",
                      onTap: () {},
                    ),
                    BookCardHome(
                      color: Colors.blueAccent,
                      picture: "assets/images/book2.png",
                      title: "ANNUAL REPORT",
                      prix: "120 DH",
                      onTap: () {},
                    ),
                    BookCardHome(
                      color: Colors.blueAccent,
                      picture: "assets/images/book2.png",
                      title: "ANNUAL REPORT",
                      prix: "120 DH",
                      onTap: () {},
                    ),
                    BookCardHome(
                      color: Colors.blueAccent,
                      picture: "assets/images/book2.png",
                      title: "ANNUAL REPORT",
                      prix: "120 DH",
                      onTap: () {},
                    ),
                    BookCardHome(
                      color: Colors.blueAccent,
                      picture: "assets/images/book2.png",
                      title: "ANNUAL REPORT",
                      prix: "120 DH",
                      onTap: () {},
                    ),
                    BookCardHome(
                      color: Colors.blueAccent,
                      picture: "assets/images/book2.png",
                      title: "ANNUAL REPORT",
                      prix: "120 DH",
                      onTap: () {},
                    ),
                    BookCardHome(
                      color: Colors.blueAccent,
                      picture: "assets/images/book2.png",
                      title: "ANNUAL REPORT",
                      prix: "120 DH",
                      onTap: () {},
                    ),
                    BookCardHome(
                      color: Colors.blueAccent,
                      picture: "assets/images/book2.png",
                      title: "ANNUAL REPORT",
                      prix: "120 DH",
                      onTap: () {},
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
