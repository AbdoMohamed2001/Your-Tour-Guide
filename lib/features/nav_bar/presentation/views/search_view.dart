import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/features/search/domain/use_cases/get_search_suggestion_usecase.dart';
import 'package:your_tour_guide/features/search/domain/use_cases/search_collections_usecase.dart';
import 'package:your_tour_guide/features/search/presentation/cubit/search_suggestion/search_suggestion_cubit.dart';

import '../../../search/presentation/cubit/search/search_cubit.dart';
import '../../../search/presentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => SearchCubit(getIt<SearchAcrossCollectionsUseCase>(),
                getIt<GetSearchSuggestionsUseCase>())),
        BlocProvider(
            create: (_) =>
                SearchSuggestionCubit(getIt<GetSearchSuggestionsUseCase>())),
      ],
      child: const SearchViewBody(),
    );
  }
}
