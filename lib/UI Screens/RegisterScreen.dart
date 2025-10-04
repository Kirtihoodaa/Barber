import 'package:barber/Theme/AppColors.dart';
import 'package:barber/Theme/CustomButton.dart';
import 'package:barber/Theme/InputFields.dart';
import 'package:barber/UI%20Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isBarber = true;

  // Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  final addressController = TextEditingController();
  final shopNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  TimeOfDay? openingTime;
  TimeOfDay? closingTime;

  // Pick time function
  Future<void> pickTime(bool isOpening) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isOpening) {
          openingTime = picked;
        } else {
          closingTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Register", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Toggle button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: Text("Barber"),
                  labelStyle: TextStyle(
                    color: isBarber ? Colors.white : Colors.black,
                  ),
                  selected: isBarber,
                  selectedColor: AppColors.yellow,
                  onSelected: (val) {
                    setState(() => isBarber = true);
                  },
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text("Customer"),
                  labelStyle: TextStyle(
                    color: !isBarber ? Colors.white : Colors.black,
                  ),
                  selected: !isBarber,
                  selectedColor: AppColors.yellow,
                  onSelected: (val) {
                    setState(() => isBarber = false);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Common fields
            CustomTextField(hintText: "Name", controller: nameController),
            const SizedBox(height: 16),
            CustomTextField(hintText: "Email", controller: emailController),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Location",
              controller: locationController,
            ),

            if (isBarber) ...[
              const SizedBox(height: 16),
              CustomTextField(
                hintText: "Address",
                controller: addressController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: "Shop Name",
                controller: shopNameController,
              ),
              const SizedBox(height: 16),

              // Opening Time Picker
              InkWell(
                onTap: () => pickTime(true),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        openingTime != null
                            ? "Opening: ${openingTime!.format(context)}"
                            : "Select Opening Time",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const Icon(Icons.access_time, color: Colors.white70),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Closing Time Picker
              InkWell(
                onTap: () => pickTime(false),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        closingTime != null
                            ? "Closing: ${closingTime!.format(context)}"
                            : "Select Closing Time",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const Icon(Icons.access_time, color: Colors.white70),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],

            const SizedBox(height: 16),
            // Password fields
            CustomTextField(
              hintText: "Password",
              controller: passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Confirm Password",
              controller: confirmPasswordController,
              isPassword: true,
            ),
            const SizedBox(height: 24),

            // Register Button
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
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable TextField Builder
}
