import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  while (true) {
    stdout.write("Enter name (or 'done' to stop): ");
    String name = stdin.readLineSync()!;
    if (name.toLowerCase() == 'done') break;

    stdout.write("Enter ID: ");
    String id = stdin.readLineSync()!;
    if (students.any((s) => s['id'] == id)) {
      print("ID already exists! Try again.");
      continue;
    }

    stdout.write("Enter score: ");
    double score = double.parse(stdin.readLineSync()!);

    students.add({
      'name': name,
      'id': id,
      'score': score,
      'grade': grade(score),
    });
  }

  if (students.isEmpty) {
    print("No data entered!");
    return;
  }

  students.sort((a, b) => b['score'].compareTo(a['score']));

  print("\n--- Student List (High → Low) ---");
  for (var s in students) {
    print("${s['name']} | ID: ${s['id']} | Score: ${s['score']} | Grade: ${s['grade']}");
  }

  print("\nTotal Students: ${students.length}");
  print("Highest Score: ${students.first['score']}");
  print("Lowest Score: ${students.last['score']}");
}

String grade(double s) {
  if (s >= 80) return 'A+';
  if (s >= 70) return 'A';
  if (s >= 60) return 'A-';
  if (s >= 50) return 'B';
  if (s >= 40) return 'C';
  if (s >= 33) return 'D';
  return 'F';
}

