import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/utils.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    Key? key,
    required this.model,
    required this.cubit,
  }) : super(key: key);
  final model;
  final cubit;
  @override
  Widget build(BuildContext context) {
    final arabicNumber = ArabicNumbers();
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    return Container(
        width: double.infinity,
      color:  HomeCubit.get(context).isDark! ? Color(0xfffffff) : Color(0xfff1f1f1) ,
      //Light Mode
      // Color(0xfff1f1f1),
      height: 70,
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
                  // TODO: add hotel web site to firebase
                  onTap: () async {
                    var url = Uri.parse(model.website!);
                    if (await canLaunchUrl(
                      url,
                    )) {
                      await launchUrl(url);
                    }
                    ;
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.laptop,
                        size: 22,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        S.of(context).WebSite,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 3.0, left: 2),
                        child: isArabic()? null :Icon(
                          Icons.north_east,
                          size: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5,),
                //------------------------------------
                //Email
                GestureDetector(
                  onTap: () async {
                    String? encodeQueryParameters(
                        Map<String, String> params) {
                      return params.entries
                          .map((MapEntry<String, String> e) =>
                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          .join('&');
                    }

                    final Uri emailUrl = Uri(
                      scheme: 'mailto',
                      path: 'abdo.mohammed1778@gmail.com',
                      query: encodeQueryParameters(<String, String>{
                        'subject':
                        'Example Subject & Symbols are allowed!',
                      }),
                    );
                    //'mailto:${toEmail}?subject=${Uri.encodeFull(subject)}&body=${message}';
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
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        S.of(context).Email,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 3.0, left: 2),
                        child: isArabic() ? null : Icon(
                          Icons.north_east,
                          size: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5,),
                //------------------------------------
                //Phone Number
                GestureDetector(
                  onTap: cubit.hasCallSupport == true
                      ? () => cubit
                      .makePhoneCall(model.phone.toString())
                      : null,
                  child: Row(

                    children: [
                      Icon(
                        Icons.phone,
                        size: 22,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        isArabic() ? arabicNumber.convert(model.phone.toString()):
                      model.phone.toString(),
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                //------------------------------------
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//              // Container(
//               //   width: double.infinity,
//               //   color: const Color(0xfff1f1f1),
//               //   height: 70,
//               //   child: Padding(
//               //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               //     child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //       children: [
//               //         //WebSite
//               //         GestureDetector(
//               //           onTap: () async {
//               //             String? encodeQueryParameters(
//               //                 Map<String, String> params) {
//               //               return params.entries
//               //                   .map((MapEntry<String, String> e) =>
//               //                       '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//               //                   .join('&');
//               //             }
//               //
//               //             final Uri emailUrl = Uri(
//               //               scheme: 'mailto',
//               //               path: 'abdo.mohammed1778@gmail.com',
//               //               query: encodeQueryParameters(<String, String>{
//               //                 'subject':
//               //                     'Example Subject & Symbols are allowed!',
//               //               }),
//               //             );
//               //             //'mailto:${toEmail}?subject=${Uri.encodeFull(subject)}&body=${message}';
//               //             if (await canLaunchUrl(emailUrl)) {
//               //               await launchUrl(emailUrl);
//               //             }
//               //           },
//               //           child: Row(
//               //             children: [
//               //               Icon(
//               //                 Icons.laptop,
//               //               ),
//               //               SizedBox(
//               //                 width: 10,
//               //               ),
//               //               Text(
//               //                 'WebSite',
//               //                 style: TextStyle(
//               //                   decoration: TextDecoration.underline,
//               //                   fontWeight: FontWeight.bold,
//               //                 ),
//               //               ),
//               //               Padding(
//               //                 padding:
//               //                     const EdgeInsets.only(bottom: 3.0, left: 2),
//               //                 child: Icon(
//               //                   Icons.north_east,
//               //                   size: 15,
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //         ),
//               //         //------------------------------------
//               //         //Email
//               //         GestureDetector(
//               //           onTap: () async {
//               //             String? encodeQueryParameters(
//               //                 Map<String, String> params) {
//               //               return params.entries
//               //                   .map((MapEntry<String, String> e) =>
//               //                       '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//               //                   .join('&');
//               //             }
//               //
//               //             final Uri emailUrl = Uri(
//               //               scheme: 'mailto',
//               //               path: 'abdo.mohammed1778@gmail.com',
//               //               query: encodeQueryParameters(<String, String>{
//               //                 'subject':
//               //                     'Example Subject & Symbols are allowed!',
//               //               }),
//               //             );
//               //             //'mailto:${toEmail}?subject=${Uri.encodeFull(subject)}&body=${message}';
//               //             if (await canLaunchUrl(emailUrl)) {
//               //               await launchUrl(emailUrl);
//               //             }
//               //           },
//               //           child: Row(
//               //             children: [
//               //               Icon(Icons.email_outlined),
//               //               SizedBox(
//               //                 width: 10,
//               //               ),
//               //               Text(
//               //                 'Email',
//               //                 style: TextStyle(
//               //                   decoration: TextDecoration.underline,
//               //                   fontWeight: FontWeight.bold,
//               //                 ),
//               //               ),
//               //               Padding(
//               //                 padding:
//               //                     const EdgeInsets.only(bottom: 3.0, left: 2),
//               //                 child: Icon(
//               //                   Icons.north_east,
//               //                   size: 15,
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //         ),
//               //         //------------------------------------
//               //         //Phone Number
//               //         GestureDetector(
//               //           onTap: () async {
//               //             String? encodeQueryParameters(
//               //                 Map<String, String> params) {
//               //               return params.entries
//               //                   .map((MapEntry<String, String> e) =>
//               //                       '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//               //                   .join('&');
//               //             }
//               //
//               //             final Uri emailUrl = Uri(
//               //               scheme: 'mailto',
//               //               path: 'abdo.mohammed1778@gmail.com',
//               //               query: encodeQueryParameters(<String, String>{
//               //                 'subject':
//               //                     'Example Subject & Symbols are allowed!',
//               //               }),
//               //             );
//               //             //'mailto:${toEmail}?subject=${Uri.encodeFull(subject)}&body=${message}';
//               //             if (await canLaunchUrl(emailUrl)) {
//               //               await launchUrl(emailUrl);
//               //             }
//               //           },
//               //           child: Row(
//               //             children: [
//               //               Icon(Icons.phone),
//               //               SizedBox(
//               //                 width: 10,
//               //               ),
//               //               Text(
//               //                 restaurantModel.phone.toString(),
//               //                 style: TextStyle(
//               //                   decoration: TextDecoration.underline,
//               //                   fontWeight: FontWeight.bold,
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //         ),
//               //         //------------------------------------
//               //       ],
//               //     ),
//               //   ),
//               // ),