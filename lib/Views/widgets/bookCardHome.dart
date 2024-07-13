import 'package:flutter/material.dart';

class BookCardHome extends StatelessWidget {
  const BookCardHome({
    super.key,
    required this.prix,
    required this.title,
    required this.picture,
    required this.color,
  });
  final String prix;
  final String title;
  final String picture;
  final dynamic color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("clicked");
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Container(
          child: Column(
            children: [
              Container(
                color: color,
                height: 150,
                width: 130,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // Shadow color
                          offset: Offset(6, 5), // Shadow offset
                          blurRadius: 6, // Shadow blur radius
                        ),
                      ],
                    ),
                    child: Image.asset(
                      picture,
                      fit: BoxFit.contain,
                      height: 130,
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                // margin: EdgeInsets.only(left: 28),
                child: Text(
                  prix,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
