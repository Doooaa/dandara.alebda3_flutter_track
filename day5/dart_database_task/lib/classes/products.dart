import '../imports.dart';
import 'package:dart_database_task/classes/review.dart';

File fileProducts = File(productsDatacsv);

class Product {
  String id;
  String name;
  String price;
  bool Items_in_stock = false;
  List<dynamic>? listreviews;
  // ⬇ not required but named parameter
  Product(this.name, this.price, this.Items_in_stock, this.listreviews)
      : id = User.generateUserId(); //1-✅ random uid :id=wait  finish function

  static saveproductDataToCsv(Product product) {
    //1-✅ add new product
    if (!fileProducts.existsSync()) {
      // Check if not exists add CSV header

      fileProducts.writeAsStringSync('id,name,price,list\n');
    }
    // file exist Append product data to the CSV file
    fileProducts.writeAsStringSync(
        '${product.id},${product.name},${product.price},${product.Items_in_stock},${product.listreviews}\n',
        mode: FileMode.append);
  }

  //2-✅ show all data
  static  showAllProducts() async {
    if (fileProducts.existsSync()) {
      String csvString = await fileProducts.readAsString();
      return await ("showing all Products now \n !${csvString}");
    } else
      return "there is no Products";
  }

  //3-✅ show data by id product
  static getproductById(String productId) async {
    var isfound = false;
    if (fileProducts.existsSync()) {
      String csvString = await fileProducts.readAsString();
      List<String> rows = csvString.split('\n');

      for (String row in rows) {
        List<String> values = row.split(',');
        if (values.length >= 4 && values[0] == productId) {
          // product found, return a product object
          isfound = true;
          print("data in product \n");
          print(
              "name :${values[1]} price: ${values[2]} ,Items_in_stock: ${values[3]}");
        }
      }
      if (!isfound) print('id not found in this class');
      return null;
    }
    // product not found, return null
  }

  //4 -✅ udate product
  static UpdateProductDataById(
      String ProductId, Map<String, dynamic> data) async {
    bool isFoundId = false;
    if (fileProducts.existsSync()) {
      String csvString = await fileProducts.readAsString();
      List<String> rows = csvString.split('\n');
      List<String>? values;
      for (int i = 0; i < rows.length; i++) {
        values = rows[i].split(',');
        if (values.length >= 3 && values[0] == ProductId) {
          isFoundId = true;

          values[1] = data['name'];
          values[2] = data['price'];
          values[3] = data['review'];
          rows[i] = values.join(',');
          break;
        }
      }
      String updatedCsvContent = rows.join('\n');
      await fileProducts.writeAsString(updatedCsvContent);
    }
    if (isFoundId == false)
      print("Can Not Update 'the Product id not found'\n");
    return null;
  }

//4 -✅ add review product
  static  AddreviewProductDataById(
      String ProductId, Reviews listrev) async {
    bool isFoundId = false;
    if (fileProducts.existsSync()) {
      String csvString = await fileProducts.readAsString();
      List<String> rows = csvString.split('\n');
      List<dynamic>? values;
      for (int i = 0; i < rows.length; i++) {
        values = rows[i].split(',');
        if (values.length >= 4 && values[0] == ProductId) {
          isFoundId = true;

          values[4] = listrev.toJson().toString();
          rows[i] = values.join(',');
          break;
        }
      }
      String updatedCsvContent = rows.join('\n');
      await fileProducts.writeAsString(updatedCsvContent);
    }
    if (isFoundId == false)
      print("Can Not Update 'the Product id not found'\n");
    return null;
  }

  static  deletReviewDataById(String id) async {
    bool isFoundId = false;
    if (fileProducts.existsSync()) {
      String csvString = await fileProducts.readAsString();
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
      await fileProducts.writeAsString(updatedCsvContent);
    }
    if (isFoundId == false)
      print("ERROR!'Can Not Delete : the product not found'");
    return null;
  }
}
