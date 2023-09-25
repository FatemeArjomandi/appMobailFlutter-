class TravelModel {
  String name;
  String location;
  String image;
  String distance;
  String temp;
  String rating;
  String description;
  String price;
  TravelModel({
    required this.name,
    required this.location,
    required this.image,
    required this.distance,
    required this.temp,
    required this.rating,
    required this.description,
    required this.price,
  });
}

List<TravelModel> travelList = [
  TravelModel(
      name: 'Tabrize',
      location: 'Iran_AzarBijan_shargi',
      image: 'assets/tabriz.png',
      distance: '612',
      temp: '20',
      rating: '4.5',
      description:
          'Undoubtedly, Tabriz is a beautiful and deep and full of story city in the contemporary era, the leader and pioneer of Iranian cities',
      price: '212'),
  TravelModel(
      name: 'Tehran',
      location: 'Iran_Capital_Tehran',
      image: 'assets/tehran.jpg',
      distance: '124',
      temp: '23',
      rating: '5',
      description:
          'Undoubtedly, Tehran is a beautiful and deep and full of story city in the contemporary era, the leader and pioneer of Iranian cities',
      price: '300'),
  TravelModel(
      name: 'Shiraz',
      location: 'Iran_Shiraz',
      image: 'assets/shiraz.jpg',
      distance: '504',
      temp: '31',
      rating: '3.2',
      description:
          'Undoubtedly, Shiraz is a beautiful and deep and full of story city in the contemporary era, the leader and pioneer of Iranian cities',
      price: '403'),
  TravelModel(
      name: 'Esfahan',
      location: 'Iran_Esfahan',
      image: 'assets/esfahan.jpg',
      distance: '742',
      temp: '36',
      rating: '4.2',
      description:
          'Undoubtedly, Esfahan is a beautiful and deep and full of story city in the contemporary era, the leader and pioneer of Iranian cities',
      price: '600'),
];
