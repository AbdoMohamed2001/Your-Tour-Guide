import '../generated/l10n.dart';

class ServicesContainerEntity {
  final String name;
  final String collectionName;
  final String imageUrl;

  ServicesContainerEntity({
    required this.imageUrl,
    required this.name,
    required this.collectionName,
  });
}

List<ServicesContainerEntity> getServicesContainerList = [
  ServicesContainerEntity(
    collectionName: 'hotels',
    imageUrl:
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/df/05/b6/premier-le-reve-hotel.jpg?w=1200&h=-1&s=1',
    name: S.current.Hotels,
    // name: 'Hotels',
  ),
  ServicesContainerEntity(
    collectionName: 'restaurants',
    imageUrl:
        'https://mrandmrsegypt.com/wp-content/uploads/2022/11/139-Pavilion.png',
    name: S.current.Restaurants,
    // name: 'Restaurants',
  ),
  ServicesContainerEntity(
    collectionName: 'cafes',
    imageUrl: 'https://www.originaltravel.co.uk/travel-blog/ShowPhoto/235/0',
    name: S.current.Cafes,
    // name: 'Cafes',
  ),
  ServicesContainerEntity(
    collectionName: 'mosques',
    imageUrl:
        'https://www.osiristours.com/wp-content/uploads/2018/11/201803070520052732.jpg',
    name: S.current.Mosques,
    // name: 'Mosques',
  ),
  ServicesContainerEntity(
    collectionName: 'churchs',
    imageUrl:
        'https://static.wixstatic.com/media/5eff48_c8c9fa59d87e4281a06e07ed389504fe~mv2.jpg/v1/fill/w_640,h_426,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/5eff48_c8c9fa59d87e4281a06e07ed389504fe~mv2.jpg',
    name: S.current.Churches,
    // name: 'Mosques',
  ),
  ServicesContainerEntity(
    collectionName: 'malls',
    imageUrl:
        'https://www.tripsavvy.com/thmb/OO8ZmTaAXSjpzdsJoHjWguid61E=/2121x1414/filters:no_upscale():max_bytes(150000):strip_icc()/nasr-city-shopping-mall-in-cairo-521713690-30e93a9833904e5292516cebde3a4521.jpg',
    name: S.current.Malls,
    // name: 'malls',
  ),
  ServicesContainerEntity(
    collectionName: 'cinemas',
    imageUrl: 'https://www.mei.edu/sites/default/files/Egyptian%2520Cinema.jpg',
    name: S.current.Cinemas,
    // name: 'Cinemas',
  ),
];
