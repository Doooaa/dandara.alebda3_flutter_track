  


  abstract class user {
    String? name;
    String? username;
    String? dp;
    String? password;
  
   user(name ,username,dp,password)
   {
    this.name=name;
    this.username=username;
    this.password=password;
    this.dp=dp;
    
   }
     
} 
class premiunuser extends user  {
  int? discount ;

  premiunuser(this.discount,super.name, super.username, super.dp, super.password)
  {
   print("welcome of premiunuser!");
 
  }
  
  }
 
void main(List<String> args) {
  // user u = new user("Ahmed","gamal","xx","12345");
  premiunuser pu=premiunuser(22,"Ahmed","gamal","xx","12345");
  print(pu.name);
}
//جرتهم من الوجك الصعب الابسراكت 
/*                       
                        //4
  1-  calss square ex recangle ex shap*l1,l2,l3,l4) 
  2- take a cahr and draw shap  
*/ 
