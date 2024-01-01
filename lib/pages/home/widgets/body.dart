import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/home/widgets/home_list.dart';
import 'package:todo_app/providers/user_provider.dart';
import 'package:todo_app/theme/app_colors.dart';
import 'package:todo_app/theme/app_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    // "Hello, ${user.firstname.substring(0, 1).toUpperCase()}${user.firstname.substring(1)}",
    // Text(user.email)
    final now = DateTime.now();
    final currentHour = now.hour;

    String greeting = getGreeting(currentHour);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Good", //$greeting! ${user.firstname.substring(0, 1).toUpperCase()}${user.firstname.substring(1)}",
                          style: appstyle(
                            23,
                            Colors.black,
                            FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        AnimatedEmoji(AnimatedEmojis.alarmClock),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            HomeList(),
          ],
        ),
      ),
    );
  }

  String getGreeting(int hour) {
    if (hour >= 5 && hour < 12) {
      return 'Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Evening';
    } else {
      return 'Night';
    }
  }
}
