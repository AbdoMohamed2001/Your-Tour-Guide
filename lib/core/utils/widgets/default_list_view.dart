import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/widgets/default_cached_network_image.dart';

import '../constants.dart';
import '../functions/is_arabic.dart';

class DefaultListView extends StatelessWidget {
  const DefaultListView(
      {super.key, required this.list, this.collectionName, this.onTap});

  final List<dynamic> list;
  final String? collectionName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemBuilder: (_, i) => DefaultListViewItem(
        entity: list[i],
        list: list,
        onTap: onTap,
      ),
      itemCount: list.length,
    );
  }
}

class DefaultListViewItem extends StatelessWidget {
  const DefaultListViewItem({
    super.key,
    required this.list,
    required this.entity,
    this.onTap,
  });

  final List<dynamic> list;
  final entity;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (_) => AllCitiesView(
      //         city: entity,
      //       ),
      //     ),
      //   );
      //   // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   //   return pushedPage;
      //   // }));
      // },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 0.75),
                ),
              ],
            ),
            child: Stack(
              children: [
                DefaultCachedNetworkImage(
                    imageUrl: entity.imageUrl, imageHeight: 200),
                Positioned(
                  top: 145,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: BorderedText(
                      strokeColor: Colors.black,
                      strokeWidth: 2,
                      strokeCap: StrokeCap.butt,
                      strokeJoin: StrokeJoin.bevel,
                      child: Text(
                        textAlign: TextAlign.center,
                        isArabic() ? entity.nameArabic : entity.name,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                //Done
              ],
            ),
          ),
        ),
      ),
    );
  }
}
