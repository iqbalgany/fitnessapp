import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesCard extends StatelessWidget {
  final String title;
  final String set;
  final String repetition;
  final String minutes;
  final String imageUrl;
  const ActivitiesCard({
    super.key,
    required this.title,
    required this.set,
    required this.repetition,
    required this.minutes,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),

                  Row(
                    children: [
                      Text(
                        '$set sets |',
                        style: GoogleFonts.dmSans(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(width: 5),

                      Text(
                        '$repetition Repitition',
                        style: GoogleFonts.dmSans(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),

                  Container(
                    width: 100,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple.shade100,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.alarm, size: 25, color: Colors.purple),
                        SizedBox(width: 5),

                        Text(
                          minutes,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),

              Image.network(imageUrl, width: 130),
            ],
          ),
        ),
      ),
    );
  }
}
