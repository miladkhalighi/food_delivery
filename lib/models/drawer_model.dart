
import 'package:flutter/material.dart';

class DrawerModel {
  String title;
  IconData icon;

  DrawerModel({required this.title,required this.icon});
}

 List<DrawerModel> drawerList = [
   DrawerModel(title: 'Profile', icon: Icons.add),
   DrawerModel(title: 'Orders', icon: Icons.add),
   DrawerModel(title: 'Offer and promo', icon: Icons.add),
   DrawerModel(title: 'Privacy policy', icon: Icons.add),
   DrawerModel(title: 'Security', icon: Icons.add),
   DrawerModel(title: 'Sign-out', icon: Icons.add),
 ];