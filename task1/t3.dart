

void main(List<String> args) {
   print(custom_reducer([1,2,3,4] ,((acc, element) => acc+element),15));
}
 int custom_reducer(List<int>l,int Function (int acc,int element) callback,int accelerometer)
{
  return l.reduce(callback)+accelerometer;
}