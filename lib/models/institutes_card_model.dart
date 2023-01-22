import 'package:flutter/material.dart';
import 'package:learn_programming/widgets/institutes_button.dart';

class InstituteCards{
  final String image;
  final String name;

  InstituteCards({
    required this.image,
    required this.name
  });
}

List<InstituteCards> institutes = [
  InstituteCards(
      image: 'images/freecodecamp.png',
      name: 'FreeCodeCamp'),
  InstituteCards(
      image: 'images/courseera.png',
      name: 'CourseEra'),
  InstituteCards(
      image: 'images/microsoftlearn.png',
      name: 'Microsoft Learning'),
  InstituteCards(
      image: 'images/mit.png',
      name: 'MIT Open CourseWare'),
  InstituteCards(
      image: 'images/lynda.png',
      name: 'Linkedin Learning'),
  InstituteCards(
      image: 'images/udemy.png',
      name: 'Udemy'),
  InstituteCards(
      image: 'images/edX.png',
      name: 'edX'),
  InstituteCards(
      image: 'images/codeacadamey.png',
      name: 'codeAcademy'),
  InstituteCards(
      image: 'images/edureka.png',
      name: 'Edureka'),
];