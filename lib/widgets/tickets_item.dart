import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuildTicketsItem extends StatelessWidget {
  const BuildTicketsItem({
    super.key,
    required this.place,
  });

  final QueryDocumentSnapshot<Object?> place;

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
            Text(
              'Tickets',
              style: TextStyle(
                fontSize: 17,
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
                  'FOREIGNERS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                place['tickets']['foreigners']['adult'] == null
                    ? Text('')
                    : place['tickets']['foreigners']['student'] ==
                    null
                    ? Text('')
                    : Text(
                    'Adult: ${place['tickets']['foreigners']['adult']} '
                        '| Student: ${place['tickets']['foreigners']['student']}'),
              ],
            ),
            Column(
              children: [
                Text(
                  'EGYPTIANS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    'Adult: ${place['tickets']['egyptians']['adult']} | '
                        'Student: ${place['tickets']['egyptians']['student']}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
