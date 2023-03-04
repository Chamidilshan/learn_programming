import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';


class Course{
  final int id;
 final String language;
  final String name;
  //final String link;

  Course({
    required this.id,
    required this.language,
    required this.name,
    //required this.link,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
       id: json['id'],
      language: json['language'],
      name: json['name'],
      //link: json['link'],

    );
  }
}
