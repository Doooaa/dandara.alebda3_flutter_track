import 'package:dart_database_task/classes/review.dart';

import './imports.dart';
printOptions() {
  print("1-CREATE");
  print("2-SHOW ONE ");
  print("3-SHOW ALL ");
  print("4-UPDATE ");
  print("5-DELETE ");
  print("ENTER THE OPERATION NUMBER PLEASE");
}

CreateUser() {
  List<String> prompts = ['Enter your name: ', 'Enter your email: '];
  List<String> userInput = [];

  for (String prompt in prompts) {
    stdout.write(prompt);
    String input = stdin.readLineSync() ?? '';
    userInput.add(input);
  }
  String name = userInput[0];
  String email = userInput[1];

  var Newuser = User(name, email);
  User.saveUserDataToCsv(Newuser);
}

createProduct() {
  print("ENTER LIKE: CLASSNAME  NAME price bool listReview  ");
  var input = stdin.readLineSync();
  List<String> inputParts = input!.split(" ");
  var p3 = true;
  if (inputParts[3] == "false") p3 = false;
  Product p = Product(inputParts[1], inputParts[2], p3, []);
  Product.saveproductDataToCsv(p);
}

createReview() {
  print("ENTER LIKE: CLASSNAME  uid product_id text_review ");
  var input = stdin.readLineSync();

  List<String> inputParts = input!.split(" ");

  Reviews r = Reviews(inputParts[1], inputParts[2], inputParts[3]);
  Reviews.saveUserDataToCsv(r);
}

showAlldata() async {
  var classNameshowAll = stdin.readLineSync();
  if (classNameshowAll!.toLowerCase() == "user")
    print(await User.showAllUsers());
  else if (classNameshowAll.toLowerCase() == "product" ||
      classNameshowAll.toLowerCase() == "products")
    print(await Product.showAllProducts());
  else if (classNameshowAll.toLowerCase() == "review" ||
      classNameshowAll.toLowerCase() == "reviews")
    print(await Reviews.showAllReviews());
  else
    print('error ! maybe class not found!');
}

updateClasses() {
  var detialsOfShow = stdin.readLineSync();
  print("ENTER LIKE: CLASSNAME ID NAME EMAIL ");
  List<String> inputParts = detialsOfShow!.split(" ");
  if (inputParts[0].toLowerCase() == "user") {
    User.UpdateUserDataById(inputParts[1], {
      'name': inputParts[2],
      'email': inputParts[3],
    });
  } else if (inputParts[0].toLowerCase() == "review") {
    Reviews.UpdateReviewDataById(inputParts[1], {
      'uid': inputParts[2],
      'pid': inputParts[3],
      'text': inputParts[4],
    });
  } else if (inputParts[0].toLowerCase() == "product") {
    Product.UpdateProductDataById(inputParts[1], {
      'name': inputParts[2],
      'price': inputParts[3],
      'review': inputParts[4],
    });
  } else
    print('error maybe class not found!');
}

getClassByid() {
  print("ENTER LIKE: CLASSNAME ID");
  var detialsOfShow = stdin.readLineSync();
  List<String> inputParts = detialsOfShow!.split(" ");
  if (inputParts[0].toLowerCase() == "user")
    User.getUserById(inputParts[1]);
  else if (inputParts[0].toLowerCase() == "review" ||
      inputParts[0].toLowerCase() == "reviews")
    Reviews.getReviewById(inputParts[1]);
  else if (inputParts[0].toLowerCase() == "product" ||
      inputParts[0].toLowerCase() == "products")
    Product.getproductById(inputParts[1]);
  else {
    print("please enter correct syntax");
  }
}
