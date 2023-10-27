import 'package:dart_database_task/imports.dart';

class Reviews {
  String id; //to update &del
  String? textReview;
  String? idProduct;
  String? userId;
  //admin add product
  //user add review to existed product

  Reviews(
  this.userId,this.idProduct,this.textReview,):id= User.generateUserId();

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'textReview': textReview,
      'userId': userId,
      'productId': idProduct,
    };
  }
 static saveUserDataToCsv(Reviews review) {
    if (!fileReview.existsSync()) {
      // Check if the file already exists, if not, add CSV header
      fileReview.writeAsStringSync('id,name,email\n');
    }

    // Append user data to the CSV file
    fileReview.writeAsStringSync('${review.id},${review.userId},${review.idProduct},${review.textReview}\n',
        mode: FileMode.append);
  }

  static  showAllReviews() async {
    if (fileReview.existsSync()) {
      String csvString = await fileReview.readAsString();
      return await ("showing all users now !${csvString}");
    } else
      return "there is no users";
  }

  static getReviewById(String reviewId) async {
    // Load user data from the CSV file and search for the user by ID
    var isfound=false;
    if (fileReview.existsSync()) {
      String csvString = await fileReview.readAsString();
      List<String> rows = csvString.split('\n');
      for (String row in rows) {
        List<String> values = row.split(',');
        if (values.length >= 3 && values[0] == reviewId) {
          // User found, return a User object
          isfound=true;
          print("data in Review \n");
          print("user_id :${values[1]} product_id: ${values[2]} the review is:  ${values[3]}");
        }
      }
    }
    // User not found, return null
   if(!isfound) print('id not found in this class');
    return null;
  }

  static  UpdateReviewDataById(
      String reviewId, Map<String, dynamic> data) async {
    bool isFoundId = false;
    if (fileReview.existsSync()) {
      String csvString = await fileReview.readAsString();
      List<String> rows = csvString.split('\n');
      List<String>? values;
      for (int i = 0; i < rows.length; i++) {
        values = rows[i].split(',');
        if (values.length >= 4 && values[0] ==reviewId) {
          isFoundId = true;

          values[1] = data['uid'];
          values[2] = data['pid'];
          values[3] = data['text'];
          rows[i] = values.join(',');
          break;
        }
      }
      String updatedCsvContent = rows.join('\n');
      await fileReview.writeAsString(updatedCsvContent);
    }
    if (isFoundId == false) print("Can Not Update 'the user id not found'\n");
    return null;
  }

  static  deletReviewDataById(String id) async {
    bool isFoundId = false;
    if (fileReview.existsSync()) {
      String csvString = await fileReview.readAsString();
      List<String> rows = csvString.split('\n');
      List<String>? values;
      for (int i = 0; i < rows.length; i++) {
        values = rows[i].split(',');
        if (values.length >= 4 && values[0] == id) {
          isFoundId = true;
          rows.removeAt(i);
          break;
        }
      }
      String updatedCsvContent = rows.join('\n');
      await fileReview.writeAsString(updatedCsvContent);
    }
    if (isFoundId == false)
      print("ERROR!'Can Not Delete : the review not found'");
    return null;
  }
}

