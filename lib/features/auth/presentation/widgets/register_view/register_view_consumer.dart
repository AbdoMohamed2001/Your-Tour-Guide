import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/auth/presentation/widgets/register_view/register_view_body.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../nav_bar/presentation/views/main_view.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';

class RegisterViewConsumer extends StatelessWidget {
  const RegisterViewConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainView()));
        } else if (state is AuthFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return RegisterViewBody();
      },
    );
  }
}
