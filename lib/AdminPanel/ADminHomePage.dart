import 'package:barber/AdminPanel/BarberCard.dart';
import 'package:barber/Theme/AppBar.dart';
import 'package:barber/Theme/AppColors.dart';
import 'package:flutter/material.dart';

class Adminhomepage extends StatelessWidget {
  const Adminhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: CustomAppBar(title: "Admin Panel"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Registered Barbers",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            // 🔹 Use Reusable BarberCard Widget
            BarberCard(
              name: "John Barber",
              address: "123 Street Avenue, New Delhi",
              imagePath: "Assets/MainScreen/userIcon.png",
            ),

            const SizedBox(height: 16),

            BarberCard(
              name: "Mike Styles",
              address: "45 MG Road, Bengaluru",
              imagePath: "Assets/MainScreen/userIcon.png",
            ),
          ],
        ),
      ),
    );
  }
}
