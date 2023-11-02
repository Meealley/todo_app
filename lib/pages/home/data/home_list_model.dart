import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:todo_app/pages/home/model/home_list_model.dart';

final List<HomeListView> tasklist = [
  HomeListView(title: "Inbox", icon: Icons.all_inbox, color: Colors.blue),
  HomeListView(
      title: "Today", icon: Icons.date_range_rounded, color: Colors.green),
  HomeListView(title: "Upcoming", icon: Icons.date_range, color: Colors.purple),
  HomeListView(title: "Goal", icon: Ionicons.trophy, color: Colors.orange),
  HomeListView(
      title: "Projects", icon: Ionicons.pencil_sharp, color: Colors.red),
];
