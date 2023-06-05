import 'package:restaurant_marketplace_h/models/app_models.dart';

List<user> myusers = [
  user(1, 'faressi elahdj', 'f.a@gmail.com', '12345678', 'assets/images/faressielhadj.jpeg', myorders, myreviews, 'rue 1') ,
  user(2, 'omri ilyes', 'o.m@gmail.com', '12345679', 'assets/images/faressielhadj.jpeg', myorders, myreviews, 'rue 2 ') ,
  user(3, 'aomer abdelillah', 'a.a@gmail.com', '98765431', 'assets/images/faressielhadj.jpeg', myorders, myreviews, 'rue3 ') ,
  user(4, 'haddad ilyes', 'h.i@gmail.com', '147852369', 'assets/images/faressielhadj.jpeg', myorders, myreviews, 'rue4') ,
  user(5, 'saidani haithem', 's.h@gmail.com', '95123578', 'assets/images/faressielhadj.jpeg',myorders, myreviews, 'rue5') ,

] ;

List<order> myorders  = [
  order(1, '01/01/2023', 2500, 'sidi bel abbes , rue 1111', 'cooking ', 101010101, 1010010101 , 'assets/images/orderincart1.png'),
  order(1, '01/01/2023', 2500, 'sidi bel abbes , arret wiam', 'delivered ', 101010101, 1010010101,'assets/images/orderincart2.png'),
  order(1, '01/01/2023', 2500, 'sidi bel abbes , maternite', 'cooking ', 101010101, 1010010101 , 'assets/images/orderincart2.png'),
  order(1, '01/01/2023', 2500, 'sidi bel abbes , residence 1000 lits ', 'delivered ', 101010101, 1010010101,'assets/images/orderincart2.png'),
  order(1, '01/01/2023', 2500, 'sidi bel abbes , rue 1234-2', 'cooking ', 101010101, 1010010101,'assets/images/orderincart2.png'),
  order(1, '01/01/2023', 2500, 'sidi bel abbes , cite 6', 'cooking ', 101010101, 1010010101,'assets/images/orderincart2.png'),


] ;

List<restaurant> myrestaurants = [
  restaurant(345235346, 'Mc Donald\'s', mydishes, 'assets/images/restaurant.png', myreviews , ['image1 ' , 'image 2 ' , 'image 3 ']),
  restaurant(345235346, '122 ', mydishes, 'assets/images/restaurant.png', myreviews , ['image1 ' , 'image 2 ' , 'image 3 ']),
  restaurant(345235346, 'nafoora ', mydishes, 'assets/images/restaurant.png', myreviews , ['image1 ' , 'image 2 ' , 'image 3 ']),
  restaurant(345235346, 'laroma', mydishes, 'assets/images/restaurant.png', myreviews , ['image1 ' , 'image 2 ' , 'image 3 ']),


] ;

List<menu_item> mydishes = [
  menu_item(1111111, 'Tacos', 500, 'Brown the beef better. Lean ground beef – I like to use 85% lean angus. Garlic – use fresh  chopped. Spices chili powder, cumin, onion powder.', 'assets/images/mydish.png', myadditions),
  menu_item(1111111, 'Pizza', 500, 'this tacos is delicious', 'assets/images/mydish.png', myadditions),
  menu_item(1111111, 'Sandwich', 500, 'this tacos is delicious', 'assets/images/mydish.png', myadditions),
  menu_item(1111111, 'Marinee', 500, 'this tacos is delicious', 'assets/images/mydish.png', myadditions),


] ;

List<review> myreviews = [
  review(111143502, 235035238, 'Really convenient and the points system helps benefit loyalty. Some mild glitches here and there, but nothing too egregious. Obviously needs to roll out to more remote. ', 4.5, '23/5/2022'),
  review(342343252, 342352352, 'Been a life saver for keeping our sanity during the pandemic, although they could improve some of their ui and how they handle specials as it often is unclear how to use them or everything is sold out so fast it feels a bit bait and switch. Still I\'d be stir crazy and losing track of days without so... ', 3, '23/5/2022'),
  review(352562362, 653745754, 'Got an intro offer of 50% off first order that did not work..... I have scaled the app to find a contact us button but only a spend with us button available. ', 3, '23/5/2022'),
  review(463456345, 453634634, 'Got an intro offer of 50% off first order that did not work..... I have scaled the app to find a contact us button but only a spend with us button available. ', 3, '23/5/2022'),


] ;

List<addition> myadditions = [
  addition('mayonnaise', 100, 'descreption', 'assets/images/addition1.png'),
  addition('ketchapp', 100, 'descreption', 'assets/images/addition2.png'),
  addition('sauce algerienne', 100, 'descreption', 'assets/images/addition3.png'),



] ;

List<category> mycategories = [
 category('assets/images/burger1.png', 'burger') ,
  category('assets/images/pizza1.png', 'pizza ') ,
  category('assets/images/sandwich1.png', 'tacos') ,
  category('assets/images/cheese1.png', 'cheese') ,
  category('assets/images/donut1.png', 'donut') ,



] ;

List<tags> mytags = [
  tags('burger', 'chicken', 'fastfood')  ,
  tags('pizza', 'chicken', 'tacos')  ,
  tags('cheese', 'donut', 'sandwiches')  ,
  tags('burrito', 'mexican', 'fastfood')  ,


] ;