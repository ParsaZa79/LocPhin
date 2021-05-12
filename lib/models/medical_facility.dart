import 'package:flutter/material.dart';

class MedicalFacility {
  final int id, rate;
  final List<String> numbers, addresses;
  final String name, description, website, imageURL;
  final Color color;
  const MedicalFacility(
      {this.id,
      this.name,
      this.addresses,
      this.description,
      this.numbers,
      this.website,
      this.rate,
      this.color,
      this.imageURL});
}
