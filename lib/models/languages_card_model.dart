import 'package:flutter/material.dart';

class LanguageCards{
  final String image;
  final String name;

  LanguageCards({
        required this.image,
        required this.name
      });
}

List<LanguageCards> languages = [
  LanguageCards(
      image: 'images/c.png',
      name: 'C'),
  LanguageCards(
      image: 'images/java.png',
      name: 'Java'),
  LanguageCards(
      image: 'images/csharp.png',
      name: 'C#'),
  LanguageCards(
      image: 'images/python.png',
      name: 'Python'),
  LanguageCards(
      image: 'images/cplus.png',
      name: 'C++'),
  LanguageCards(
      image: 'images/kotlin.png',
      name: 'Kotlin'),
  LanguageCards(
      image: 'images/php.png',
      name: 'PHP'),

];