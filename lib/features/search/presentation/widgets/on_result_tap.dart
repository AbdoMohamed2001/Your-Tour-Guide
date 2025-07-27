import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/search/presentation/cubit/search/search_cubit.dart';

import '../../domain/entities/search_result_entity.dart';

void onResultTap(SearchResultEntity result, BuildContext context) {
  context.read<SearchCubit>().fetchEntity(result);
}
