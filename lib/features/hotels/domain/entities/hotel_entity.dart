import 'package:your_tour_guide/features/hotels/domain/entities/hotel_room_entity.dart';

class HotelEntity {
  final String about;
  final String aboutArabic;
  final String address;
  final String addressArabic;
  final String averagePrice;
  final Map<String, dynamic> book;
  final String cityName;
  final String cityNameArabic;
  final List distanceTo;
  final List distanceToArabic;
  final String docId;
  final String email;
  final List features;
  final List featuresArabic;
  final String imageUrl;
  final List images;
  final String mapUrl;
  final String name;
  final String nameArabic;
  final List nearlyTo;
  final List nearlyToArabic;
  final num noOfFloors;
  final num noOfRooms;
  final num phone;
  final num rate;
  final List roomFacilities;
  final List roomFacilitiesArabic;
  final List<HotelRoomEntity> rooms;
  final List<HotelRoomEntity> roomsArabic;
  final Map<String, dynamic> socialMedia;
  final num stars;
  final String webSite;

  HotelEntity(
      {required this.about,
      required this.aboutArabic,
      required this.address,
      required this.addressArabic,
      required this.averagePrice,
      required this.book,
      required this.cityName,
      required this.cityNameArabic,
      required this.distanceTo,
      required this.distanceToArabic,
      required this.docId,
      required this.email,
      required this.features,
      required this.featuresArabic,
      required this.imageUrl,
      required this.images,
      required this.mapUrl,
      required this.name,
      required this.nameArabic,
      required this.nearlyTo,
      required this.nearlyToArabic,
      required this.noOfFloors,
      required this.noOfRooms,
      required this.roomFacilities,
      required this.roomFacilitiesArabic,
      required this.rooms,
      required this.roomsArabic,
      required this.phone,
      required this.rate,
      required this.socialMedia,
      required this.stars,
      required this.webSite});
}
