import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../cubits/home/home_cubit.dart';
import '../functions/is_arabic.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    Key? key,
    required this.entity,
  }) : super(key: key);
  final entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color:
          HomeCubit.get(context).isDark! ? Color(0xfffffff) : Color(0xfff1f1f1),
      height: 50,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //WebSite
                GestureDetector(
                  onTap: () async {
                    var url = Uri.parse(entity.website!);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.laptop, size: 22),
                      SizedBox(width: 5),
                      Text(
                        S.of(context).WebSite,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0, left: 2),
                        child: isArabic()
                            ? null
                            : Icon(
                                Icons.north_east,
                                size: 13,
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                //------------------------------------
                //Email
                GestureDetector(
                  onTap: () async {
                    String? encodeQueryParameters(Map<String, String> params) {
                      return params.entries
                          .map((MapEntry<String, String> e) =>
                              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          .join('&');
                    }

                    final Uri emailUrl = Uri(
                      scheme: 'mailto',
                      path: 'abdo.mohammed1778@gmail.com',
                      query: encodeQueryParameters(<String, String>{
                        'subject': 'Example Subject & Symbols are allowed!',
                      }),
                    );
                    if (await canLaunchUrl(emailUrl)) {
                      await launchUrl(emailUrl);
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 22,
                      ),
                      SizedBox(width: 5),
                      Text(
                        S.of(context).Email,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0, left: 2),
                        child: isArabic()
                            ? null
                            : Icon(
                                Icons.north_east,
                                size: 13,
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                //------------------------------------
                //Phone Number
                // GestureDetector(
                //   onTap: cubit.hasCallSupport == true
                //       ? () => cubit.makePhoneCall(entity.phone.toString())
                //       : null,
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.phone,
                //         size: 22,
                //       ),
                //       SizedBox(
                //         width: 5,
                //       ),
                //       Text(
                //         isArabic()
                //             ? arabicNumber.convert(entity.phone.toString())
                //             : entity.phone.toString(),
                //         textDirection: TextDirection.ltr,
                //         style: TextStyle(
                //           decoration: TextDecoration.underline,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                //------------------------------------
              ],
            ),
          ),
        ],
      ),
    );
  }
}
