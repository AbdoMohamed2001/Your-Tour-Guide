import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:your_tour_guide/core/data/repos/features_repo.dart';
import 'package:your_tour_guide/core/domain/entities/feature_entity.dart';

part 'feature_state.dart';

class FeatureCubit extends Cubit<FeatureState> {
  FeatureCubit(this.featuresRepo) : super(FeatureInitial());
  final FeaturesRepo featuresRepo;
  List<FeatureEntity> features = [];
  getFeatureDetails({Map<String, dynamic>? query, required String path}) async {
    emit(FeatureLoading());
    var result = await featuresRepo.getFeature(path, query);
    result.fold(
      (failure) {
        emit(FeatureFailure(failure.message));
      },
      (featureDetails) {
        features = featureDetails;
        emit(FeatureSuccess(features));
      },
    );
  }
}
