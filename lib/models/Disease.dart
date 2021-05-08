import 'package:flutter/cupertino.dart';

class Disease {
  final int id, grade;
  final String name, description, imageSRC;
  Disease({
    @required this.id,
    @required this.name,
    @required this.imageSRC,
    this.description,
    this.grade,
  });
}

List<Disease> diseases = [
  Disease(id: 1, name: "Autism", imageSRC: "../assets/images/autism.png"),
  Disease(id: 2, name: "ADHD", imageSRC: "../assets/images/adhd.png"),
  Disease(id: 3, name: "Alzymer", imageSRC: "../assets/images/alzheimer.png")
];
