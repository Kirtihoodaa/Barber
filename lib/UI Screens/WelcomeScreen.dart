import 'package:barber/Theme/CustomButton.dart';
import 'package:barber/UI Screens/LoginScreen.dart';
import 'package:barber/UI Screens/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background image with reduced opacity
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/MainScreen/welcomepage.jpeg"),
                fit: BoxFit.cover,
                // ↓ Reduce brightness & opacity
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),

          // 🔹 Foreground content
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 80),

              // App name / logo
              const Center(
                child: Text(
                  "CHOPER",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),

              // Buttons
              Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: Column(
                  children: [
                    // Login button
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: CustomButton(
                        text: "Login",
                        foregroundColor: Colors.white,
                        expand: true,
                        onPressed: () {
                          Get.to(() => LoginScreen());
                        },
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Register button
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: CustomButton(
                        text: "Register",
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        expand: true,
                        onPressed: () {
                          Get.to(() => RegisterScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
