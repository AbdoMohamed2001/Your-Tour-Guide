import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repos/mosque_repo.dart';
import '../../domain/entities/mosque_entity.dart';

part 'mosque_state.dart';

class MosqueCubit extends Cubit<MosqueState> {
  MosqueCubit(this.mosqueRepo) : super(MosqueInitial());

  final MosqueRepo mosqueRepo;
  List<MosqueEntity> allMosques = [];

  void getMosques({String? cityName}) async {
    emit(MosquesGetLoading());

    var result = await mosqueRepo.getMosques(cityName: cityName);
    result.fold(
      (fail) {
        emit(MosquesGetFailure(fail.message));
      },
      (rests) {
        allMosques = rests;
        emit(MosquesGetSuccess(allMosques));
      },
    );
  }
}
