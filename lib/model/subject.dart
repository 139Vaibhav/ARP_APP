import 'package:flutter/foundation.dart';

enum Complexity {
  Easy,
  Medium,
  Hard
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious
}

class Subject {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final String resourceUrl;
  final List<String> grades;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isEx;
  final bool isA;
  final bool isP;
  final bool isF;

  const Subject({
    @required this.id, 
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.resourceUrl,
    @required this.grades,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isEx,
    @required this.isA,
    @required this.isP,
    @required this.isF
    });
}