import 'package:intl/intl.dart';

DateTime now = DateTime.now();

class Activity {
  String id;
  String name;
  String duration;
  String type;
  String description;
  String date = DateFormat('MM/yyyy').format(now);

  Activity(
      {
      required this.id,
      required this.name,
      required this.duration,
      required this.type,
      required this.description});

  static fromMap(Object? data) {
    if (data is Map<String, dynamic>) {
      return Activity(
          id: data['id'] as String,
          name: data['name'] as String,
          duration: data['duration'] as String,
          type: data['type'] as String,
          description: data['description'] as String);
    }
    return null;
  }
}
