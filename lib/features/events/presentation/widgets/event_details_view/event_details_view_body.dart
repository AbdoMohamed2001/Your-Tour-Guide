import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';
import 'package:your_tour_guide/core/utils/widgets/default_read_more.dart';
import 'package:your_tour_guide/features/events/presentation/cubit/event_cubit.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/widgets/contact_widget.dart';
import '../../../../../core/utils/widgets/default-services-details-image/default_services_details_image.dart';
import '../../../../../core/utils/widgets/tours/inclusions_widget.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/event_entity.dart';

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
              DefaultServiceDetailsImage(
                cubitDataKeyCurrentContext: GlobalKey(),
                entity: eventEntity,
                isNotEvent: false,
              ),
              kSizedBox,
              //-------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          Assets.imagesCalendar,
                          width: 90,
                          height: 90,
                        ),
                        Column(
                          children: [
                            Text(
                              S.of(context).startDate,
                              style: TextStyles.bold18,
                            ),
                            Text(
                              eventEntity.startDate,
                              style: TextStyles.regular18,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              S.of(context).endDate,
                              style: TextStyles.bold18,
                            ),
                            Text(
                              eventEntity.endDate,
                              style: TextStyles.regular18,
                            ),
                          ],
                        ),
                      ],
                    ),
                    kSizedBox,
                    Divider(
                      height: 0.5,
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                    kSizedBox,
                    //-------------------------------------------------
                    //about
                    Text(
                      S.of(context).about,
                      style: TextStyles.bold18,
                    ),
                    kSizedBox,
                    // Text in about
                    ReadMoreWidget(text: eventEntity.about),
                    kSizedBox,
                    //-------------------------------------------------
                    //contact
                    ContactWidget(entity: eventEntity),
                    kSizedBox,
                    Text(
                      S.of(context).inclusions,
                      style: TextStyles.bold22,
                    ),
                    kSizedBox,
                    InclusionsWidget(eventEntity: eventEntity),
                    kSizedBox,
                    Text(
                      S.of(context).exclusions,
                      style: TextStyles.bold22,
                    ),
                    kSizedBox,
                    InclusionsWidget(
                      eventEntity: eventEntity,
                      isInclusion: false,
                    ),
                    kSizedBox,
                    //-------------------------------------------------
                    // organizer
                    Row(
                      children: [
                        Text(
                          S.of(context).moreInformation,
                          textAlign: TextAlign.center,
                          style: TextStyles.bold16,
                        ),
                        SizedBox(width: 25),
                        GestureDetector(
                          onTap: () async {
                            var url = Uri.parse(eventEntity.website);
                            if (await canLaunchUrl(
                              url,
                            )) {
                              await launchUrl(url);
                            }
                            ;
                          },
                          child: Image.network(
                            'https://www.tripsinegypt.com/wp-content/uploads/2022/11/trips-in-egypt-logo.png',
                            width: 120,
                            height: 70,
                          ),
                        )
                      ],
                    ),
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
