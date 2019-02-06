import 'package:flutter/material.dart';

List<Tab> tabsMasters = [];

void tabBarBuilder({String text, IconData icon}){
  Tab choice = Tab(
    icon: Icon(icon),
    text: text,
  );
  tabsMasters.add(choice);
}