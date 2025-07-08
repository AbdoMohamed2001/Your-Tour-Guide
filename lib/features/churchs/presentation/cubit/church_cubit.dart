import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repos/church_repo.dart';
import '../../domain/entities/church_entity.dart';

part 'church_state.dart';

class ChurchCubit extends Cubit<ChurchState> {
  ChurchCubit(this.churchRepo) : super(ChurchInitial());

  final ChurchRepo churchRepo;
  List<ChurchEntity> allChurchs = [];

  void getChurchs({String? cityName}) async {
    emit(ChurchsGetLoading());

    var result = await churchRepo.getChurches();
    result.fold(
      (fail) {
        emit(ChurchsGetFailure(fail.message));
      },
      (rests) {
        allChurchs = rests;
        emit(ChurchsGetSuccess(allChurchs));
      },
    );
  }
}
