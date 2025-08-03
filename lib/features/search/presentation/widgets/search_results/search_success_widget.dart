import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/search_result_entity.dart';
import 'build_search_result_item.dart';

class SearchSuccessWidget extends StatelessWidget {
  const SearchSuccessWidget(
      {super.key, required this.searchResults, required this.query});

  final List<SearchResultEntity> searchResults;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 6),
        Text(
          "${S.of(context).founded} ${searchResults.length} ${S.of(context).searchResultsAbout} ${query}",
          // "وجد ${searchResults.length} نتائج بحث عن ${query}",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).disabledColor,
              ),
        ),
        SizedBox(height: 6),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final result = searchResults[index];
              return SearchResultItem(result: result);
            },
          ),
        ),
      ],
    );
  }
}
