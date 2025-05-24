import 'package:artemi_project/src/app.dart';
import 'package:artemi_project/src/data/database_repository.dart';
import 'package:artemi_project/src/data/mock_database_repository.dart';
import 'package:flutter/material.dart';

void main() {
  final DatabaseRepository db = MockDatabaseRepository();
  runApp(App(db));
}
