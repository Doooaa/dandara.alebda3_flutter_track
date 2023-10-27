import '../imports.dart';

class User  {
  String id;
  String name;
  String email;

  User(this.name, this.email) : id = generateUserId(); //1-✅ random uid
  static String generateUserId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  addNewUserToDatabase() {
    //1-✅ add new user
    String? name = stdin.readLineSync();
    String? email = stdin.readLineSync();
    User user = User(name!, email!);
    saveUserDataToCsv(user);
  }

  static saveUserDataToCsv(User user) {
    if (!file.existsSync()) {
      // Check if the file already exists, if not, add CSV header
      file.writeAsStringSync('id,name,email\n');
    }

    // Append user data to the CSV file
    file.writeAsStringSync('${user.id},${user.name},${user.email}\n',
        mode: FileMode.append);
  }

  static  showAllUsers() async {
    if (file.existsSync()) {
      String csvString = await file.readAsString();
      return await ("showing all users now !${csvString}");
    } else
      return "there is no users";
  }

  static  getUserById(String userId) async {
    // Load user data from the CSV file and search for the user by ID
    if (file.existsSync()) {
      String csvString = await file.readAsString();
      List<String> rows = csvString.split('\n');
      for (String row in rows) {
        List<String> values = row.split(',');
        if (values.length >= 3 && values[0] == userId) {
          // User found, return a User object
          print("name :${values[1]} password: ${values[2]}");
        }
      }
    }
    // User not found, return null
    print('id not found in this class');
    return null;
  }

  static  UpdateUserDataById(
      String userId, Map<String, dynamic> data) async {
    bool isFoundId = false;
    if (file.existsSync()) {
      String csvString = await file.readAsString();
      List<String> rows = csvString.split('\n');
      List<String>? values;
      for (int i = 0; i < rows.length; i++) {
        values = rows[i].split(',');
        if (values.length >= 3 && values[0] == userId) {
          isFoundId = true;

          values[1] = data['name'];
          values[2] = data['email'];
          rows[i] = values.join(',');
          break;
        }
      }
      String updatedCsvContent = rows.join('\n');
      await file.writeAsString(updatedCsvContent);
    }
    if (isFoundId == false) print("Can Not Update 'the user id not found'\n");
    return null;
  }

  static  deletUserDataById(String userId) async {
    bool isFoundId = false;
    if (file.existsSync()) {
      String csvString = await file.readAsString();
      List<String> rows = csvString.split('\n');
      List<String>? values;
      for (int i = 0; i < rows.length; i++) {
        values = rows[i].split(',');
        if (values.length >= 3 && values[0] == userId) {
          isFoundId = true;
          rows.removeAt(i);
          break;
        }
      }
      String updatedCsvContent = rows.join('\n');
      await file.writeAsString(updatedCsvContent);
    }
    if (isFoundId == false)
      print("ERROR!'Can Not Delete : the user id not found'");
    return null;
  }
}
