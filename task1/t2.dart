 import 'dart:math';

void main(List<String> args) {
   List<int> l=[1,2,3,3,3,3,5];
   
   print(castom_any(l,((e) => e==3)));//found
   print(castom_any(l,((e) => e==8)));//not found


    print(".......................................................");
    print(castom_some(l,((e) => e==3)));
    print(".......................................................");
    print(castom_every(l,((e) => e==3)));
}
//....................................................................
bool castom_any(List<int> l,bool Function (int e)cback)
{

            //take  bool Function (int)
   return l.any(cback);
  
}
bool castom_every(List<int> l,bool Function (int e)cback)
{

            //take  bool Function (int)
   return l.every(cback);
  
}
//.......................................................................

bool castom_some(List<int> l,bool Function (int e)cback)
{
   List frequancy=[];

     frequancy= l.where(cback).toList();
     if(frequancy.length>=2)
      return true;
     else return false;
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