class Car{
  final String? name ;
  final String? imageUrl;
  const Car({this.name,this.imageUrl});
}
final List<Car> data = [
  const Car(name: 'Tesla Model S', imageUrl: 'https://example.com/tesla_model_s.jpg'),
  const Car(name: 'BMW i8', imageUrl: 'https://example.com/bmw_i8.jpg'),
  const Car(name: 'Audi R8', imageUrl: 'https://example.com/audi_r8.jpg'),
  const Car(name: 'Mercedes-Benz S-Class', imageUrl: 'https://example.com/mercedes_s_class.jpg'),
  const Car(name: 'Porsche 911', imageUrl: 'https://example.com/porsche_911.jpg'),
];