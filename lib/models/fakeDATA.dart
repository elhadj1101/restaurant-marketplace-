import 'package:restaurant_marketplace_h/models/app_models.dart';

List<user> myusers = [
  user(1, 'faressi elahdj', 'f.a@gmail.com', '12345678', 'assets/images/faressielhadj.jpeg', [], [], 'rue 1') ,
  user(2, 'omri ilyes', 'o.m@gmail.com', '12345679', 'assets/images/faressielhadj.jpeg', [], [], 'rue 2 ') ,
  user(3, 'aomer abdelillah', 'a.a@gmail.com', '98765431', 'assets/images/faressielhadj.jpeg', [], [], 'rue3 ') ,
  user(4, 'haddad ilyes', 'h.i@gmail.com', '147852369', 'assets/images/faressielhadj.jpeg', [], [], 'rue4') ,
  user(5, 'saidani haithem', 's.h@gmail.com', '95123578', 'assets/images/faressielhadj.jpeg', [], [], 'rue5') ,

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
  restaurant(345235346, 'Pizza Gos', mydishes, 'photo_id', myreviews , ['image1 ' , 'image 2 ' , 'image 3 ']),
  restaurant(345235346, '122 ', mydishes, 'photo_id', myreviews , ['image1 ' , 'image 2 ' , 'image 3 ']),
  restaurant(345235346, 'nafoora ', mydishes, 'photo_id', myreviews , ['image1 ' , 'image 2 ' , 'image 3 ']),
  restaurant(345235346, 'laroma', mydishes, 'photo_id', myreviews , ['image1 ' , 'image 2 ' , 'image 3 ']),


] ;

List<menu_item> mydishes = [
  menu_item(1111111, 'tacos', 500, 'this tacos is delicious', 'photo_id', myadditions),
  menu_item(1111111, 'pizza', 500, 'this tacos is delicious', 'photo_id', myadditions),
  menu_item(1111111, 'sandwitch', 500, 'this tacos is delicious', 'photo_id', myadditions),
  menu_item(1111111, 'marinee', 500, 'this tacos is delicious', 'photo_id', myadditions),


] ;

List<review> myreviews = [
  review(111143502, 235035238, 'this is good restaurant ', 3, '23/5/2022'),
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
 category('assets/images/burger.png', 'burger') ,
  category('assets/images/pizza.png', 'pizza ') ,
  category('assets/images/sandwich.png', 'sandwiches') ,
  category('assets/images/chesse.png', 'cheese') ,
  category('assets/images/donut.png', 'donut') ,


] ;