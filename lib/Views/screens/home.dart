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
                  color:
                      Color.fromRGBO(158, 158, 158, 0.231), // تعيين لون الخلفية
                  borderRadius:
                      BorderRadius.circular(18.0), // تحديد حواف مستديرة
                ),
                margin: EdgeInsets.only(left: 7.0, right: 7.0),
                padding: EdgeInsets.only(left: 12.0, right: 5.0),
                child: Align(
                  alignment: Alignment.center,
                  child: TextFormField(
                    decoration: InputDecoration(
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
            body: Container(),
          ),
        ));
  }
}
