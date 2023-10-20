import 'dart:io';
import 'package:hive/hive.dart';
part 'notes.g.dart';


@HiveType(typeId: 0)
class Notes {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  Notes({
    required this.title,
    required this.description
  });
}

@HiveType(typeId: 1)
class Users {
  @HiveField(0)
  File image;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String district;
  
  Users({
    required this.image,
    required this.name,
    required this.email,
    required this.district
  });
}