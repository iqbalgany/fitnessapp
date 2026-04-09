import 'package:fitnessapp/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: Text(
              'SelfFit',
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(height: 30),

          Image.asset('assets/yoga.jpg', fit: BoxFit.cover),

          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'START FROM ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'TODAY !',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          Center(
            child: Text(
              '"Fitness is not about appearance,\nbut a reflection of inner discipline"',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 40),

          Center(
            child: ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.authPath);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.deepOrange),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15),
                  ),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
