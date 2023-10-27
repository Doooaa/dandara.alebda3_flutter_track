// import '../imports.dart';

// abstract class GeneralClass {
//  File fileName;
//  String Class_Name;
//  String id;
// GeneralClass(this.fileName,this.Class_Name);
// static String generateproductId() {
    
//     return DateTime.now().millisecondsSinceEpoch.toString();
//   }

//   User(this.name, this.email) : id = generateproductId(); //1-✅ random uid
//    saveDataToCsv(String id ,String name,String emial_price_review,{dynamic anyparameter}) {
//     if (!fileName.existsSync()) {
//       // Check if the fileName already exists, if not, add CSV header
//       fileName.writeAsStringSync('id,name,email,anyparameter\n');
//     }

//     // Append class data to the CSV fileName
//     fileName.writeAsStringSync('${id},${name},${emial_price_review},${anyparameter}\n',
//         mode: FileMode.append);
//   }

//    Future<String> showAllclass(String ClassName) async {
//     if (fileName.existsSync()) {
//       String csvString = await fileName.readAsString();
//       return await ("showing all class now !${csvString}");
//     } else
//       return "there is no ${ClassName}";
//   }

//  getclassNameById(String classNameId,String paramter2,dynamic para3) async {
//     // Load class data from the CSV file and search for the class by ID
//     if (fileName.existsSync()) {
//       String csvString = await file.readAsString();
//       List<String> rows = csvString.split('\n');
//       for (String row in rows) {
//         List<String> values = row.split(',');
//         if (values.length >= 3 && values[0] == classNameId) {
//           // class found, return a class object
//           print("name :${values[1]} , ${paramter2}: ${values[2]} , ${para3}: ${values[3]} , ");
//         }
//       }
//     }
//     // class not found, return null
//     print('id not found in this ${Class_Name}');
//     return null;
//   }

//    UpdateclassDataById(
//       String classId, Map<dynamic, dynamic> data) async {
//     bool isFoundId = false;
//     if (fileName.existsSync()) {
//       String csvString = await fileName.readAsString();
//       List<String> rows = csvString.split('\n');
//       List<String>? values;
//       for (int i = 0; i < rows.length; i++) {
//         values = rows[i].split(',');
//         if (values.length >= 3 && values[0] == classId) {
//           isFoundId = true;

//           values[1] = data['p1'];//name email text
//           values[2] = data['p2'];//emial price stars
          
//           rows[i] = values.join(',');
//           break;
//         }
//       }
//       String updatedCsvContent = rows.join('\n');
//       await fileName.writeAsString(updatedCsvContent);
//     }
//     if (isFoundId == false) print("Can Not Update 'the ${Class_Name} id not found'\n");
//   }

//     deletclassDataById(String classId) async {
//     bool isFoundId = false;
//     if (fileName.existsSync()) {
//       String csvString = await fileName.readAsString();
//       List<String> rows = csvString.split('\n');
//       List<String>? values;
//       for (int i = 0; i < rows.length; i++) {
//         values = rows[i].split(',');
//         if (values.length >= 3 && values[0] == classId) {
//           isFoundId = true;
//           rows.removeAt(i);
//           break;
//         }
//       }
//       String updatedCsvContent = rows.join('\n');
//       await fileName.writeAsString(updatedCsvContent);
//     }
//     if (isFoundId == false)
//       print("ERROR!'Can Not Delete : the ${Class_Name} id not found'");
//     return null;
//   }


// }
