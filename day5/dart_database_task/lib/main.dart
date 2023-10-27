import './imports.dart';
import 'package:dart_database_task/classes/review.dart';

void main() async {
  bool willContinue = true;
  while (willContinue) {
    printOptions();
    var oprationNumber = stdin.readLineSync();
    if (oprationNumber == '1') {
      //create............✅
      var ClassName = stdin.readLineSync();
      ClassName = ClassName!.toLowerCase();
      if (ClassName == "")
        print("please enter the Name of class");
      else {
        if (ClassName == 'user')
          CreateUser();
        else if (ClassName == 'product' || ClassName == 'products')
          createProduct();
        else if (ClassName == 'review' || ClassName == 'reviews')
          createReview();
        else
          print('class not found!');
      }
    } else if (oprationNumber == '2') //SHOW BY Id............✅
    {
      getClassByid();
    } else if (oprationNumber == '3')
      showAlldata();
    else if (oprationNumber == '4') {
      updateClasses();
    } else if (oprationNumber == '5') {
      print("ENTER LIKE: CLASSNAME ID");
      var detialsOfShow = stdin.readLineSync();
      List<String> inputParts = detialsOfShow!.split(" ");
      if (inputParts[0].toLowerCase() == "user")
        User.getUserById(inputParts[1]);
      else if (inputParts[0].toLowerCase() == "review" ||
          inputParts[0].toLowerCase() == "reviews")
        Reviews.deletReviewDataById(inputParts[1]);
      else if (inputParts[0].toLowerCase() == "product" ||
          inputParts[0].toLowerCase() == "products")
        Product.deletReviewDataById(inputParts[1]);
      else {
        print("please enter correct syntax");
      }
    }

    print("if you want to continue press y else press n ");
    var char = stdin.readLineSync();
    if (char == 'n') willContinue = false;
  }
}
