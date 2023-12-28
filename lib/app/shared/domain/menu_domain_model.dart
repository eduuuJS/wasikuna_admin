import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasikuna_admin/core/routes/app_router.dart';

class MenuDomain {
  String title;
  IconData icon;
  bool isRedirect;
  String? routeName;

  MenuDomain(
      {required this.title,
      required this.icon,
      required this.isRedirect,
      this.routeName});
}

List<MenuDomain> mainMenuList = [
  MenuDomain(
      title: "Inicio",
      icon: Iconsax.home,
      isRedirect: true,
      routeName: AppRoutesNamed.homeRoute),
  MenuDomain(
      title: "Recibos",
      icon: Iconsax.receipt,
      isRedirect: false,
      routeName: "Recibos"),
  MenuDomain(
      title: "Reservar",
      icon: Iconsax.reserve,
      isRedirect: true,
      routeName: AppRoutesNamed.commonAreasRoute),
  MenuDomain(
      title: "Invitados",
      icon: Iconsax.airdrop,
      isRedirect: false,
      routeName: "Invitados"),
  MenuDomain(
      title: "Finanzas",
      icon: Iconsax.chart_1,
      isRedirect: false,
      routeName: "Finanzas"),
];

List<MenuDomain> secondaryMenuList = [
  MenuDomain(
      title: "Term. condiciones",
      icon: Iconsax.convert_3d_cube,
      isRedirect: false,
      routeName: "Term. condiciones"),
  MenuDomain(
      title: "Ayuda",
      icon: Iconsax.health,
      isRedirect: false,
      routeName: "Ayuda"),
  MenuDomain(
      title: "Hablar con wasikuna",
      icon: Iconsax.watch_status,
      isRedirect: false,
      routeName: "Hablar con wasikuna"),
];
