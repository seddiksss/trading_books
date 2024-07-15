import 'package:flutter/material.dart';

class BookCardHome extends StatelessWidget {
  const BookCardHome({
    super.key,
    required this.prix,
    required this.title,
    required this.picture,
    required this.color,
    required this.onTap,
  });
  final String prix;
  final String title;
  final String picture;
  final dynamic color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          // bottom: 15
        ),
        child: SizedBox(
          // margin: EdgeInsets.all(100),
          height: 200,
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
                          offset: const Offset(6, 5), // Shadow offset
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
                padding: const EdgeInsets.only(left: 10),
                // margin: EdgeInsets.only(top: 20),
                height: 10,
                // margin: EdgeInsets.only(left: 28),
                child: Text(
                  prix,
                  style: const TextStyle(color: Colors.red, fontSize: 15),
                  // textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
