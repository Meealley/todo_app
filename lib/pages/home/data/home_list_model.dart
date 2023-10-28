import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:todo_app/pages/home/model/home_list_model.dart';

final List<HomeListView> tasklist = [
  HomeListView(title: "Inbox", icon: Icons.all_inbox, color: Colors.purple),
  HomeListView(
      title: "Today", icon: Icons.date_range_rounded, color: Colors.purple),
  HomeListView(title: "Upcoming", icon: Icons.date_range, color: Colors.purple),
  HomeListView(title: "Goal", icon: Ionicons.trophy, color: Colors.purple),
];
