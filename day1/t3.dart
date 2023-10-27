

void main(List<String> args) {
   print(custom_reducer([1,2,3,4] ,((acc, element) => acc+element),15));
}
 int custom_reducer(List<int>l,int Function (int acc,int element) callback,int accelerometer)
{
  int ans=0;
   int ac=accelerometer;
  for(int i=0;i< l.length-1 ;i++)
  {      
         ac+=l[i];
      //  print(ac);       
  }                //4   + 21 ==25
    ans=callback(l[l.length-1],ac);
  return ans;
}
// 1 ,2,3,4
//  15+1  =16
//  16 +2=18 
//   18+3=21
//   21+4=25

