import 'dart:mirrors';

class  Time{
  int?  hours, minutes,  seconds;
  Time()
  {
     hours=minutes=seconds=0;
  }
  //named constractor
  Time.validValuesForMember (int h,int m,int s)
  {
   // condation for validValuesForMember to h,m,s
   if(h>=0&&h<=24){
      this.hours=h;
      
   }else  this.hours=0;
   if(m>=0&&m<=60){
      this.minutes=m;
      
   }
   else this.minutes=0;
   if(s>=0&&s<=24){
      this.seconds=s;
      
   }
   else{
     this.seconds=0;
   }


  }
  // (c)
  String show() //30:8
  {
    return '${this.hours.toString().padLeft(2,'0')}:${this.minutes.toString().padLeft(2,'0')}:${this.seconds.toString().padLeft(2,'0')}'.toString(); 
  }
// d
Time operator + (Time other)
    {
      int TotalHours=0;
      int TotalMinutes=0;
      int Totalseconds=0;
      
           Totalseconds=this.seconds! + other.seconds!;
           TotalMinutes=this.minutes! + other.minutes!;
           TotalHours=this.hours! + other.hours!;
           if(Totalseconds>60){
              Totalseconds =Totalseconds%60;
               TotalMinutes++;
              

           }
            if(TotalMinutes>60)
               {
                TotalMinutes=TotalMinutes%60;
               TotalHours++;
               
               }
           
           if(TotalHours>24)
           {
             TotalHours=TotalHours%24;
    
           }
       return  Time.validValuesForMember(TotalHours,TotalMinutes,Totalseconds);
      
    }
 



}

//(e)
    
     void main(List<String> args) {
  Time t=Time.validValuesForMember(2, 40, 5);
  Time t2=Time.validValuesForMember(24, 40, 5);
       final  x= t + t2;
       print({x.hours});
       print({x.minutes});
       print({x.seconds});
     print(x.show());  
}
