import 'package:barber/AdminPanel/UserDetail.dart';
import 'package:barber/Theme/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BarberCard extends StatelessWidget {
  final String name;
  final String address;
  final String imagePath;
  final VoidCallback? onTap;

  const BarberCard({
    super.key,
    required this.name,
    required this.address,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          onTap ??
          () {
            Get.to(() => UserDetailsScreen());
          },
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: AppColors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        shadowColor: AppColors.yellow.withOpacity(0.95),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔹 Barber Avatar (flush with left edge)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: AppColors.yellow,
                  backgroundImage: AssetImage(imagePath),
                ),
              ),

              const SizedBox(width: 16),

              // 🔹 Barber Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      address,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
