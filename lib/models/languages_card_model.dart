import 'package:flutter/material.dart';

class LanguageCards{
  final String image;
  final String name;
  final String description;


  LanguageCards({
        required this.image,
        required this.name,
    required this.description
      });
}

List<LanguageCards> languages = [
  LanguageCards(
      image: 'images/c.png',
      name: 'C',
    description: 'C is a general-purpose, high-level programming language. C is a valuable skill for anyone interested in computer programming and can open up a wide range of career opportunities in fields such as software engineering, embedded systems, and cybersecurity'

  ),
  LanguageCards(
      image: 'images/java.png',
      name: 'Java',
      description: 'Java is a widely-used programming language known for its versatility and performance. It is particularly useful for developing web applications, mobile apps, and server-side software. Java is also an object-oriented language, which provides a framework for organizing code into reusable, modular components.'
  ),
  LanguageCards(
      image: 'images/csharp.png',
      name: 'C#', description: 'C# is a modern, multi-paradigm programming language developed by Microsoft for use on the .NET Framework. It is widely used for developing Windows applications, web applications, and video games. C# is known for its simplicity, type safety, and object-oriented programming capabilities.'),
  LanguageCards(
      image: 'images/python.png',
      name: 'Python', description: 'Python is a high-level, interpreted programming language that is widely used for scientific computing, data analysis, artificial intelligence, and web development. It is known for its simplicity, readability, and large standard library, which provides a wide range of tools and modules for developers to use.'),
  LanguageCards(
      image: 'images/cplus.png',
      name: 'C++', description: 'C++ is a general-purpose, high-performance programming language that is widely used in system programming, game development, and scientific computing. It is known for its low-level control over hardware, object-oriented programming capabilities, and high-performance computing capabilities.'),
  LanguageCards(
      image: 'images/kotlin.png',
      name: 'Kotlin', description: 'Kotlin is a modern, multi-platform programming language developed by JetBrains. It is widely used for developing Android applications, web applications, and server-side software. Kotlin is known for its conciseness, safety, and interoperability with Java.'),
  LanguageCards(
      image: 'images/php.png',
      name: 'PHP', description: 'PHP is a server-side scripting language that is widely used for web development. It is known for its ease of use, low cost of deployment, and wide availability of frameworks and libraries. PHP is particularly useful for developing dynamic web applications and content management systems.'),

];