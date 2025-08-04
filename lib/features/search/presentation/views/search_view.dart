import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/features/search/domain/use_cases/get_entity_from_search_usecase.dart';
import 'package:your_tour_guide/features/search/domain/use_cases/get_search_suggestion_usecase.dart';
import 'package:your_tour_guide/features/search/domain/use_cases/search_collections_usecase.dart';
import 'package:your_tour_guide/features/search/presentation/cubit/search_suggestion/search_suggestion_cubit.dart';

import '../../../../core/cubits/home/home_cubit.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../cubit/search/search_cubit.dart';
import '../widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).search,
        leading: CustomAppBarIconButton(
          onPressed: () {
            getIt<HomeCubit>().changeIndex(0);
          },
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => SearchCubit(
                    getIt<SearchAcrossCollectionsUseCase>(),
                    getIt<GetSearchSuggestionsUseCase>(),
                    getIt<GetEntityFromSearchUseCase>(),
                  )),
          BlocProvider(
              create: (_) =>
                  SearchSuggestionCubit(getIt<GetSearchSuggestionsUseCase>())),
        ],
        child: const SearchViewBody(),
      ),
    );
  }
}
