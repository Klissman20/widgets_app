import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

final appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Buttons',
      subTitle: 'Botones en flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Cards',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicators',
      subTitle: 'Infinitos y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars & Dialogs',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbar',
      icon: Icons.info_rounded),
  MenuItem(
      title: 'Animated Container',
      subTitle: 'Stateful widget animado',
      link: '/animated',
      icon: Icons.animation_outlined),
  MenuItem(
      title: 'Checkbos, Radios % Tiles',
      subTitle: 'Controles de UO=I',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
];
