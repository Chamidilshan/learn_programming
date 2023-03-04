import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';


class Course{
  final String id;
  final String language;
  final String name;
  final String link;

  Course({required this.name, required this.link, required this.id, required this.language});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      language: json['languages'],
      name: json['name'],
      link: json['link'],

    );
  }
}
