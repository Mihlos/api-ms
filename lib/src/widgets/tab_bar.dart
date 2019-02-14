import 'package:flutter/material.dart';

List<Tab> tabsMasters = [];
List<Tab> tabsSells = [];

void tabBarBuilder({String section, String text, IconData icon}){
  Tab choice = Tab(
    icon: Icon(icon),
    text: text,
  );
  if (section == 'Masters') tabsMasters.add(choice);
  if (section == 'Sells') tabsSells.add(choice);
}