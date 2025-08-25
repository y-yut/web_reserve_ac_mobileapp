class Logger {
  static void log(String message) {
    print(message);
  }
}

class User {
  final String id;
  final String name;

  User({required this.id, required this.name});
}