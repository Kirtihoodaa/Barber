import 'package:barber/Theme/AppBar.dart';
import 'package:barber/Theme/AppColors.dart';
import 'package:barber/Theme/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  // 🔹 Helper Widget for displaying info rows
  Widget buildInfoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              "$label:",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(title: "User Details"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Profile Avatar
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: AppColors.yellow,
                backgroundImage: const AssetImage(
                  "Assets/MainScreen/userIcon.png",
                ),
              ),
            ),
            const SizedBox(height: 50),

            // 🔹 Static User Information
            buildInfoTile("Name", "John Barber"),
            buildInfoTile("Address", "123 Street Avenue, New Delhi"),
            buildInfoTile("Location", "New Delhi"),
            buildInfoTile("Phone", "+91 9876543210"),
            buildInfoTile("Email", "johnbarber@gmail.com"),
            buildInfoTile("Shop Name", "John’s Premium Cuts"),

            Spacer(),

            // 🔹 Accept / Decline Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 🔹 Decline Button
                Expanded(
                  child: CustomButton(
                    text: "Decline",
                    backgroundColor: Colors.red.shade600,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      Get.snackbar(
                        "Action Declined",
                        "User has been declined successfully.",
                        backgroundColor: Colors.red.shade600,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(12),
                        borderRadius: 10,
                        icon: const Icon(Icons.cancel, color: Colors.white),
                        duration: const Duration(seconds: 2),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),

                // 🔹 Accept Button
                Expanded(
                  child: CustomButton(
                    text: "Accept",
                    backgroundColor: AppColors.yellow,
                    foregroundColor: Colors.black,
                    onPressed: () {
                      Get.snackbar(
                        "Action Accepted",
                        "User has been accepted successfully.",
                        backgroundColor: Color.fromARGB(255, 115, 225, 120),
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(12),
                        borderRadius: 10,
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                        duration: const Duration(seconds: 2),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
