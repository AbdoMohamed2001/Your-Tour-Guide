part of 'feature_cubit.dart';

@immutable
sealed class FeatureState {}

final class FeatureInitial extends FeatureState {}

final class FeatureLoading extends FeatureState {}

final class FeatureSuccess extends FeatureState {
  final List<FeatureEntity> featureDetails;

  FeatureSuccess(this.featureDetails);
}

final class FeatureFailure extends FeatureState {
  final String message;

  FeatureFailure(this.message);
}
