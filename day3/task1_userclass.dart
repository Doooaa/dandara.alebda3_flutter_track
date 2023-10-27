class freeuser{
  String? uerName;
  String? lastname;
  String? password;
  String?email;

  double total_amount=0;
  
  freeuser(uerName,lastname,password,email)
  {
    this.uerName=uerName;
    this.lastname=lastname;
    this.email=email;
    this.password=password;
  }

  BuyProduct(double price){
    total_amount+=price;
    return total_amount;
  }
 
}
 class piadUser  extends freeuser{
   plan? Planmempership;
   piadUser(uerName,lastname,email,password,Planmempership):
   super(uerName,lastname,email,password){
    this.Planmempership=Planmempership;

   }

  double? discountFun(double price){
     return price * Planmempership!._priceWillbeDiscounted; 
   }
  
 }

  //abstract 
  class plan  {
      double  _priceWillbeDiscounted=0;
      plan(discounPrice)
      {
        this._priceWillbeDiscounted=discounPrice;
      }
  }
 class gold extends plan{
  gold(): super(0.5);
 }

 class silver extends plan{
  silver(super._priceWillbeDiscounted);
   set DiscountPriceMembership(double Price){
       this._priceWillbeDiscounted=Price*.25;
    }
 }

 class diamon  extends plan{
  diamon(super._priceWillbeDiscounted);
   set DiscountPriceMembership(double Price){
       this._priceWillbeDiscounted=Price*.75;
    }
 }
  void main(List<String> args) {
    piadUser puser=piadUser("doaa", 'gamal', '12345', "doaa@gmail.com",'gold');
    //get my price with discount
   print( puser.discountFun(20.2));
   //set price by plan class accroding mempership

   gold  g=gold();
   //setter 
   g._priceWillbeDiscounted=100;
   print(g._priceWillbeDiscounted);
   print( puser.discountFun(100));
   silver s=silver(60.0);
   diamon d=diamon(60.0);
}