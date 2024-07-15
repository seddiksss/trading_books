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
    final mediaQuery = MediaQuery.of(context);
    // final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return MaterialButton(
      onPressed: onTap,
      child: Column(
        children: [
          Container(
            color: color,
            height: screenHeight / 3.5,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Shadow color
                      offset: const Offset(8, 7), // Shadow offset
                      blurRadius: 8, // Shadow blur radius
                    ),
                  ],
                ),
                child: Image.asset(
                  picture,
                  fit: BoxFit.contain,
                  height: screenHeight / 5,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            prix,
            style: const TextStyle(color: Colors.red, fontSize: 15),
            // textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
