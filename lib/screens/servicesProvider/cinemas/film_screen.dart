import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:your_tour_guide/widgets/none_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../../../models/cinema_model.dart';

class FilmScreen extends StatelessWidget {
  const FilmScreen({
    Key? key,
    required this.cinemaModel,
    required this.index,
  }) : super(key: key);

  final CinemaModel cinemaModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoneAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Image
            Stack(
              children: [
                Image.network(
                  cinemaModel.films![index]['imageUrl'],
                  height: 500,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
            IconButton(
          onPressed: () async {
            Navigator.pop(context,true);

          },
          icon:  Icon(
            isArabic()?FontAwesomeIcons.chevronRight
                :FontAwesomeIcons.chevronLeft,
            color: HomeCubit.get(context).isDark! ? Colors.white : Colors.black,
            size: 40,
          ),
        ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            //----------------
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Name and rate
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isArabic()
                            ? cinemaModel.filmsArabic![index]['name']
                            : cinemaModel.films![index]['name'],
                        style: TextStyle(fontSize: 26),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                          ),
                          Text(
                            '${cinemaModel.films![index]['rate']}/10',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //category
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(S.of(context).genre,
                          style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'كوميدي',
                            style: TextStyle(color: Colors.orange,
                            fontSize: 16
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(S.of(context).length,
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                          Text(
                            '2h',
                            style: TextStyle(color: Colors.orange,
                            fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // isArabic() ? Text(
                  //     'تصنيف العمل : ${cinemaModel.filmsArabic![index]['category']}')
                  // :Text('تصنيف العمل : ${cinemaModel.films![index]['category']}')
                  // ,
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.white,
                    indent: 20,
                    endIndent: 20,
                  ),
                  //Description
                  Text(
                    isArabic()
                        ? cinemaModel.filmsArabic![index]['description']
                        : cinemaModel.films![index]['description'],
                    style: TextStyle(fontSize: 16,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  HeadText(text: S.of(context).cast),
                  SizedBox(
                    height: 40,

                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, indexx) => Text(
                        isArabic()?
                          cinemaModel.filmsArabic![index]['cast'][indexx]
                          :cinemaModel.films![index]['cast'][indexx],
                      style: TextStyle(fontSize: 17,
                      ),
                      ),
                      separatorBuilder: (_, indexx) => Text("  -  "),
                      itemCount: 4,
                    ),
                  ),

                  // SizedBox(
                  //   height: 99,
                  //   child: GridView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 1,
                  //         mainAxisSpacing: 10,
                  //   ),
                  //       itemBuilder: (_,indexx){
                  //     return Container(
                  //       child: Text(cinemaModel.filmsArabic![index]['cast'][indexx]),
                  //     );
                  //   },
                  //     itemCount: 4,
                  //   ),
                  // ),

                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //
                  //     Text('امينة خليل'),
                  //     Text('محمد ممدوح'),
                  //     Text('امينة خليل'),
                  //     Text('محمد ممدوح'),
                  //     Text('امينة خليل'),
                  //
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
