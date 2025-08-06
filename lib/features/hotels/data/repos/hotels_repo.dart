import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/hotels/domain/entities/hotel_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class HotelsRepo {
  Future<Either<Failure, List<HotelEntity>>> getHotels({String? cityName});
}
