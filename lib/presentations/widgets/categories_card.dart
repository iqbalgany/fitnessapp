import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  final String title;
  final int exercises;
  final double minutes;
  final String imageUrl;
  const CategoriesCard({
    super.key,
    required this.title,
    required this.exercises,
    required this.minutes,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),

                  Text(
                    '$exercises Exercises',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),

                  Text(
                    '$minutes Minutes',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),

              Image.network(imageUrl, width: 150),
            ],
          ),
        ),
      ),
    );
  }
}
