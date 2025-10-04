import 'package:barber/Theme/AppColors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onMenuTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const CustomAppBar({
    super.key,
    this.title,
    this.onMenuTap,
    this.onNotificationTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      child: Container(
        height: preferredSize.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.yellow.withOpacity(0.85),
              Colors.black.withOpacity(0.85),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 🔹 Left: Hamburger Icon
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: onMenuTap ?? () {},
                    ),

                    // 🔹 Center Title (Optional)
                    if (title != null)
                      Expanded(
                        child: Text(
                          title!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                      )
                    else
                      const Spacer(),

                    // 🔹 Right: Notification + Profile icons
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                            size: 26,
                          ),
                          onPressed: onNotificationTap ?? () {},
                        ),
                        GestureDetector(
                          onTap: onProfileTap ?? () {},
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 Increased AppBar height here
  @override
  Size get preferredSize => const Size.fromHeight(170);
}
