import 'package:restaurant_marketplace_h/models/app_models.dart';

List<user> myusers = [
  user(1, 'faressi elahdj', 'f.a@gmail.com', '12345678', 'assets/images/faressielhadj.jpeg', myorders, myreviews, 'rue 1') ,
  user(2, 'omri ilyes', 'o.m@gmail.com', '12345679', 'assets/images/faressielhadj.jpeg', myorders, myreviews, 'rue 2 ') ,
  user(3, 'aomer abdelillah', 'a.a@gmail.com', '98765431', 'assets/images/faressielhadj.jpeg', myorders, myreviews, 'rue3 ') ,
  user(4, 'haddad ilyes', 'h.i@gmail.com', '147852369', 'assets/images/faressielhadj.jpeg', myorders, myreviews, 'rue4') ,
  user(5, 'saidani haithem', 's.h@gmail.com', '95123578', 'assets/images/faressielhadj.jpeg',myorders, myreviews, 'rue5') ,

] ;

List<order> myorders  = [
  order(1, '01/01/2023', 2500, 'sidi bel abbes , rue 1111', 'cooking ', 101010101, 1010010101),
  order(1, '01/01/2023', 2500, 'sidi bel abbes , arret wiam', 'delivered ', 101010101, 1010010101),
  order(1, '01/01/2023', 2500, 'sidi bel abbes , maternite', 'cooking ', 101010101, 1010010101),
  order(1, '01/01/2023', 2500, 'sidi bel abbes , residence 1000 lit ', 'delivered ', 101010101, 1010010101),
  order(1, '01/01/2023', 2500, 'sidi bel abbes , rue 1234-2', 'cooking ', 101010101, 1010010101),
  order(1, '01/01/2023', 2500, 'sidi bel abbes , cite 6', 'cooking ', 101010101, 1010010101),


] ;

List<restaurant> myrestaurants = [
  restaurant(345235346, 'Mc Donald\'s', mydishes, 'assets/images/restaurant.png', myreviews , ['image1 ' , 'image 2 ' , 'image 3 ']),
  restaurant(345235346, '122 ', mydishes, 'assets/images/restaurant.png', myreviews , ['image1 ' , 'image 2 ' , 'image 3 ']),
  restaurant(345235346, 'nafoora ', mydishes, 'assets/images/restaurant.png', myreviews , ['image1 ' , 'image 2 ' , 'image 3 ']),
  restaurant(345235346, 'laroma', mydishes, 'assets/images/restaurant.png', myreviews , ['image1 ' , 'image 2 ' , 'image 3 ']),


] ;

List<menu_item> mydishes = [
  menu_item(1111111, 'Tacos', 500, 'this tacos is delicious', 'assets/images/mydish.png', myadditions),
  menu_item(1111111, 'Pizza', 500, 'this tacos is delicious', 'assets/images/mydish.png', myadditions),
  menu_item(1111111, 'Sandwich', 500, 'this tacos is delicious', 'assets/images/mydish.png', myadditions),
  menu_item(1111111, 'Marinee', 500, 'this tacos is delicious', 'assets/images/mydish.png', myadditions),


] ;

List<review> myreviews = [
  review(111143502, 235035238, 'this is good restaurant ', 4.5, '23/5/2022'),
  review(342343252, 342352352, 'this is good restaurant ', 3, '23/5/2022'),
  review(352562362, 653745754, 'this is good restaurant ', 3, '23/5/2022'),
  review(463456345, 453634634, 'this is good restaurant ', 3, '23/5/2022'),


] ;

List<addition> myadditions = [
  addition('mayonnaise', 100, 'descreption', 'photo_id'),
  addition('ketchapp', 100, 'descreption', 'photo_id'),
  addition('sauce algerienne', 100, 'descreption', 'photo_id'),



] ;

List<category> mycategories = [
 category('assets/images/burger1.png', 'burger') ,
  category('assets/images/pizza1.png', 'pizza ') ,
  category('assets/images/sandwich1.png', 'mexican') ,
  category('assets/images/cheese1.png', 'cheese') ,
  category('assets/images/donut1.png', 'donut') ,



] ;

List<tags> mytags = [
  tags('burger', 'chicken', 'fastfood')  ,
  tags('pizza', 'chicken', 'tacos')  ,
  tags('cheese', 'donut', 'sandwiches')  ,
  tags('burrito', 'mexican', 'fastfood')  ,


] ;