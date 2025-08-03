import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:your_tour_guide/core/utils/functions/get_user_data.dart';

import '../../../../core/utils/theme/text_styles.dart';
import '../../../../../../core/utils/widgets/default_icon.dart';
import '../../../../../../generated/assets.dart';
import '../cubit/profile_cubit.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      //
      buildWhen: (previous, current) =>
          current is ProfileSuccess || current is ProfileImageUploadSuccess,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //image
            SizedBox(
              height: 89,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.orange,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: getUserData().imageUrl,
                        fit: BoxFit.cover,
                        width: 80,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 5,
                    child: DefaultIcon(
                      radius: 12,
                      icon: SvgPicture.asset(
                        Assets.iconsEdit,
                        width: 18,
                        height: 18,
                        color: Colors.black,
                      ),
                      onTap: () {
                        _pickImage(context, ImageSource.gallery);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 36),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  getUserData().name,
                  style: TextStyles.bold14,
                ),
                SizedBox(height: 2),
                Text(
                  getUserData().email,
                  style: TextStyles.regular14.copyWith(
                    color: Color(0xff888FA0),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

Future<void> _pickImage(BuildContext context, ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(
    source: source,
    maxWidth: 512,
    maxHeight: 512,
    imageQuality: 85,
  );

  if (pickedFile != null) {
    context
        .read<ProfileCubit>()
        .uploadAndUpdateProfileImage(File(pickedFile.path));
  }
}
