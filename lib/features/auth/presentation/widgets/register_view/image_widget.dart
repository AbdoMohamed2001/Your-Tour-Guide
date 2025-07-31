import 'package:flutter/material.dart';

import '../../cubits/auth_cubit/auth_cubit.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.authCubit,
  });

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        authCubit.image != null
            ? CircleAvatar(
                radius: 64,
                backgroundImage: MemoryImage(authCubit.image!),
              )
            : CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://cdn-icons-png.freepik.com/512/17/17797.png',
                ),
              ),
        Positioned(
          bottom: -5,
          left: 85,
          child: InkWell(
            onTap: () {
              authCubit.selectImage();
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: Icon(
                Icons.linked_camera_outlined,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
