import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/widgets/default_read_more.dart';
import 'package:your_tour_guide/features/events/presentation/cubit/event_cubit.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/widgets/contact_widget.dart';
import '../../../../../core/utils/widgets/default-services-details-image/default_services_details_image.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/tours/inclusions_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/event_entity.dart';
import 'date_widget.dart';
import 'organizer_widget.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody({super.key, required this.eventEntity});

  final EventEntity eventEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              DefaultServiceDetailsImage(entity: eventEntity),
              kSizedBox,
              //-------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Date
                    DateWidget(eventEntity: eventEntity),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    //-------------------------------------------------
                    //about
                    HeadText(text: S.of(context).about),
                    kSizedBox,
                    // Text in about
                    ReadMoreWidget(
                      text: isArabic()
                          ? eventEntity.aboutArabic
                          : eventEntity.about,
                    ),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    HeadText(text: S.of(context).inclusions),
                    kSizedBox,
                    InclusionsWidget(eventEntity: eventEntity),
                    kSizedBox,
                    HeadText(text: S.of(context).exclusions),
                    kSizedBox,
                    InclusionsWidget(
                      eventEntity: eventEntity,
                      isInclusion: false,
                    ),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    //-------------------------------------------------
                    //contact
                    ContactWidget(entity: eventEntity),
                    kSizedBox,
                    // organizer
                    OrganizerWidget(eventEntity: eventEntity),
                    kSizedBox,
                    //-------------------------------------------------
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
