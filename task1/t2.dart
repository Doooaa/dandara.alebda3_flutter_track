 import 'dart:math';

void main(List<String> args) {
   List<int> l=[1,2,3,4,5];
   
   print(castom_any(l,((e) => e==3)));//found
   print(castom_any(l,((e) => e==8)));//not found
}

bool castom_any(List<int> l,bool Function (int e)cback)
{

            //take  bool Function (int)
   return l.any(cback);
  
}





/* tast  l=[1,2,3,4,5]
 print(  l.any((element) {
    print(element);  // 1 2 3 stop
    return element>2;
   }));
}
 ......................
 // print( l.contains(2)); 

*/