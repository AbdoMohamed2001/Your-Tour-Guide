import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/theme/app_colors.dart';
import 'package:your_tour_guide/core/utils/functions/get_collection_icon.dart';
import 'package:your_tour_guide/features/search/presentation/cubit/search/search_cubit.dart';

import '../../../../../core/utils/theme/text_styles.dart';
import '../../../domain/entities/search_result_entity.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key, required this.result});

  final SearchResultEntity result;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          context.read<SearchCubit>().fetchEntity(result);
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: getCollectionIcon(result.collection),
          ),
          title: Text(
            result.name,
            style: TextStyles.bold16,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (result.nameArabic.isNotEmpty)
                Text(
                  result.nameArabic,
                  style: TextStyles.regular14,
                ),
              const SizedBox(height: 4),
            ],
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
          ),
        ),
      ),
    );
  }
}
