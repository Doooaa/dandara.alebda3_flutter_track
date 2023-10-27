// custom_mapping(List<int> l, int Function(int e) callback,
//     [bool changeList = false]) {
//   if (changeList == true) {
//     l = l.map(
//       (e) {
//         return callback(e);
//         // return 2*e;
//       },
//     ).toList();
//   }
//   print(l);
// }

List<int>? custom_mapping2(List<int> l, int Function(int e) callback,
    [bool changeList = false]) {
  List<int> ll = [];
  if (changeList == false) {
    for (int i = 0; i < l.length; i++) {
      ll.add(callback(l[i]));
    }
    return l;
  } else {
    for (int i = 0; i < l.length; i++) {
      l[i] = (callback(l[i]));
    }
    return l;
  }
}

void main() {
  print(custom_mapping2([1, 2, 3, 4], ((e) => 2 * e))); //defult ischange ==false
  //custom_mapping([1, 2, 3, 4], ((e) => 2 * e), true); //defult ischange ==true
  print(custom_mapping2([1, 2, 3, 4], ((e) => 2 * e), true)); //defult ischange ==true
}
