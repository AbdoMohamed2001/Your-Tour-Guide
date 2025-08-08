import 'package:your_tour_guide/core/utils/theme/text_styles.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../functions/is_arabic.dart';

class TicketsWidget extends StatelessWidget {
  const TicketsWidget({
    super.key,
    required this.model,
  });

  final model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //Ticket Icon
        Column(
          children: [
            Container(
              width: 80,
              height: 80,
              child: Image.asset('assets/images/tickets.png'),
            ),
            SizedBox(height: 6),
            Padding(
              padding: isArabic()
                  ? const EdgeInsets.only(left: 20)
                  : const EdgeInsets.only(right: 20),
              child: Text(
                S.of(context).Tickets,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 30),
        //Ticket Price
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  S.of(context).FOREIGNERS,
                  style: TextStyles.bold16,
                ),
                model.tickets!['foreigners']['adult'] == null
                    ? Text('')
                    : model.tickets!['foreigners']['student'] == null
                        ? Text('')
                        : Text(
                            '${S.of(context).Adult}: ${model.tickets!['foreigners']['adult']} '
                            '| ${S.of(context).Student}: ${model.tickets!['foreigners']['student']}',
                            style: TextStyles.regular14,
                          ),
              ],
            ),
            //Egyptians
            Column(
              children: [
                Text(
                  S.of(context).EGYPTIANS,
                  style: TextStyles.bold16,
                ),
                Text(
                  '${S.of(context).Adult}: ${model.tickets!['egyptians']['adult']} | '
                  '${S.of(context).Student}: ${model.tickets!['egyptians']['student']}',
                  style: TextStyles.regular14,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
