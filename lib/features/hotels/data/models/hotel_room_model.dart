import 'package:your_tour_guide/features/hotels/domain/entities/hotel_room_entity.dart';

class HotelRoomModel {
  final String averagePrice;
  final String bed;
  final List facilities;
  final String imageUrl;
  final String name;
  final String size;
  final dynamic noOfPeople;

  HotelRoomModel({
    required this.averagePrice,
    required this.bed,
    required this.facilities,
    required this.imageUrl,
    required this.name,
    required this.size,
    required this.noOfPeople,
  });

  factory HotelRoomModel.fromJson(Map<String, dynamic> json) {
    return HotelRoomModel(
      averagePrice: json['averagePrice'],
      bed: json['bed'],
      facilities: json['facilities'] ?? [],
      imageUrl: json['imageUrl'],
      name: json['name'],
      size: json['size'],
      noOfPeople: json['noOfPeople'] ?? 0,
    );
  }

  HotelRoomEntity toEntity() {
    return HotelRoomEntity(
      averagePrice: averagePrice,
      bed: bed,
      facilities: facilities,
      imageUrl: imageUrl,
      name: name,
      size: size,
      noOfPeople: noOfPeople,
    );
  }
}
