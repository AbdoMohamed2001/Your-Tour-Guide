import 'package:cloud_firestore/cloud_firestore.dart';

class CityModel {
  final String? cafeImageUrl;
  final String? churchsImageUrl;
  final String? cinemaImageUrl;
  final String? cityName;
  final String? hotelImageUrl;
  final String? imageUrl;
  final String? mallImageUrl;
  final String? mosqueImageUrl;
  final String? placeImageUrl;
  final String? restImageUrl;
  final String? tourCompanyImageUrl;
  final String? tourGuideImageUrl;

  CityModel({
    this.cafeImageUrl,
    this.churchsImageUrl,
    this.cinemaImageUrl,
    this.hotelImageUrl,
    this.mallImageUrl,
    this.mosqueImageUrl,
    this.placeImageUrl,
    this.restImageUrl,
    this.tourCompanyImageUrl,
    this.tourGuideImageUrl,
    this.cityName,
    this.imageUrl,
  });

  List<CityModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return CityModel(
        placeImageUrl: dataMap['placeImageUrl'],
        restImageUrl: dataMap['restImageUrl'],
        tourCompanyImageUrl: dataMap['tourCompanyImageUrl'],
        tourGuideImageUrl: dataMap['tourGuideImageUrl'],
        cafeImageUrl: dataMap['cafeImageUrl'],
        churchsImageUrl: dataMap['churchsImageUrl'],
        cinemaImageUrl: dataMap['cinemaImageUrl'],
        hotelImageUrl: dataMap['hotelImageUrl'],
        mallImageUrl: dataMap['mallImageUrl'],
        mosqueImageUrl: dataMap['mosqueImageUrl'],
        cityName: dataMap['cityName'],
        imageUrl: dataMap['imageUrl'],
      );
    }).toList();
  }

  factory CityModel.fromJson(doc) {
    return CityModel(
      placeImageUrl:       doc['placeImageUrl'],
      restImageUrl:        doc['restImageUrl'],
      tourCompanyImageUrl: doc['tourCompanyImageUrl'],
      tourGuideImageUrl:   doc['tourGuideImageUrl'],
      cafeImageUrl:        doc['cafeImageUrl'],
      churchsImageUrl:     doc['churchsImageUrl'],
      cinemaImageUrl:      doc['cinemaImageUrl'],
      hotelImageUrl:       doc['hotelImageUrl'],
      mallImageUrl:        doc['mallImageUrl'],
      mosqueImageUrl:      doc['mosqueImageUrl'],
      cityName:            doc['cityName'],
      imageUrl:            doc['imageUrl'],
    );
  }
}
