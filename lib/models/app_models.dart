class restaurant {
  final int restaurant_id ;
  final String restaurant_name ;
  final List<menu_item> menu ;
  final String photo_id  ;
  final List<review>? reviews ;
  final List<String>? galery ;

  restaurant(this.restaurant_id, this.restaurant_name, this.menu, this.photo_id, this.reviews, this.galery);



}

class review {
  final rest_id ;
  final user_id ;
  final String descreption ;
  final double rating ;
  final String created_date ;

  review(this.rest_id, this.user_id, this.descreption, this.rating, this.created_date);


}

class menu_item  {
  final int id ;
  final String name ;
  final int price ;
  final String descreption ;
  final String photo_id ;
  final List<addition> additions ;

  menu_item(this.id, this.name, this.price, this.descreption, this.photo_id, this.additions) ;
}

class addition {
  final String name ;
  final int price ;
  final String descreption ;
  final String photo_id ;

  addition(this.name, this.price, this.descreption, this.photo_id );

}

class user {
  final int user_id ;
  final String fullname ;
  final String email ;
  final String phone ;
  final String photo_id ;
  final List<order>? orders ;
  final List<review>? reviews ;
  final String adress ;


  user(this.user_id, this.fullname, this.email, this.phone, this.photo_id, this.orders, this.reviews, this.adress);}

class order  {
  final int rest_id ;
  final int user_id ;
  final int order_id ;
  final String created_date ;
  final int total_price ;
  final String location ;
  final String status ;
  final String image ;

  order(this.order_id, this.created_date, this.total_price, this.location, this.status, this.rest_id, this.user_id, this.image);

}

class category {
  final String image  ;
  final String name ;

  category(this.image, this.name);

}

class tags{
  final String tag1 ;
  final String tag2 ;
  final String tag3 ;

  tags(this.tag1, this.tag2, this.tag3);

}