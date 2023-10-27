 import 'dart:math';

void main(List<String> args) {
   List<int> l=[1,2,3,3,3,3,5];
   
   print(castom_any(l,((e) => e==3)));//found
   print(castom_any(l,((e) => e==8)));//not found


    print(".......................................................");
    print(castom_some(l,((e) => e==3)));
    print(castom_some(l,((e) => e==10)));
    print(".......................................................");
    print(castom_every(l,((e) => e==3)));
}
//....................................................................

bool castom_any(List<int> l,bool Function (int e)cback)
{
  
   int  c=0;       
    for (int i = 0; i < l.length; i++) {
      if(cback(l[i])) c++;
      if(c>=1) break;
    
    }
    if(c>=1)
     return true;
    else return false;
  } 
   
      

bool castom_every(List<int> l,bool Function (int e)cback)
{

            //take  bool Function (int)
    int  c=0;       
    for (int i = 0; i < l.length; i++) {
      if(cback(l[i])) c++;
    }
    if(c==l.length)
     return true;
    else return false;
  
}
//.......................................................................
bool castom_some(List<int> l,bool Function (int e)cback)
{
    int  c=0;       
    for (int i = 0; i < l.length; i++) {
      if(cback(l[i])) c++;
    }
   
     if(c>=2)
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