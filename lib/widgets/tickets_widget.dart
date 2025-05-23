import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';

class TicketsWidget extends StatelessWidget {
  const TicketsWidget({
    super.key,
    required this.model,
  });

  final model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Ticket Icon
        Column(
          children: [
            Container(
              width: 80,
              height: 80,
              child: Image.asset('assets/images/tickets.png'),
            ),
            SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                S.of(context).Tickets,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        //Ticket Price
        Column(
          children: [
            Column(
              children: [
                Text(
                  S.of(context).FOREIGNERS,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                model.tickets!['foreigners']['adult'] == null
                    ? Text('')
                    : model.tickets!['foreigners']['student'] == null
                    ? Text('')
                    : Text(
                    '${S.of(context).Adult}: ${model.tickets!['foreigners']['adult']} '
                        '| ${S.of(context).Student}: ${model.tickets!['foreigners']['student']}'),
              ],
            ),
            //Egyptians
            Column(
              children: [
                Text(
                  S.of(context).EGYPTIANS,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    '${S.of(context).Adult}: ${model.tickets!['egyptians']['adult']} | '
                        '${S.of(context).Student}: ${model.tickets!['egyptians']['student']}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
