
custom_mapping(List<int>l, int Function(int e ) callback, [bool changeList = false]) {
    if (changeList == true) {
     l= l.map((e) {  
         return callback(e);
        // return 2*e;
        },).toList();  
    }
    print(l);
  }
  
  void  main() {
   
    custom_mapping([1,2,3,4],((e) =>2*e)); //defult ischange ==false
    custom_mapping([1,2,3,4],((e) =>2*e),true); //defult ischange ==true

}


