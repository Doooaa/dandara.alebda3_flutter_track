library csv_parser;
import 'dart:io';


export  'dart:io';
export  'package:csv/csv.dart';
export  'package:dart_database_task/classes/userClass.dart';
export  'package:dart_database_task/classes/products.dart';
export 'package:dart_database_task/function_inCondition.dart';
String csvFilePath = 'assets/UserData.csv';
String productsDatacsv='assets/productsData.csv';
String ReviewsDatacsv='assets/reviews.csv';
//assets/productsData.csv
File file = File(csvFilePath);
File fileProducts=File(productsDatacsv);
File fileReview=File(ReviewsDatacsv);

