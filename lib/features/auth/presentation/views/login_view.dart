import 'package:your_tour_guide/core/utils/functions/show_snack_bar.dart';
import 'package:your_tour_guide/core/utils/functions/show_toast.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/features/home/presentation/views/main_view.dart';
import 'package:your_tour_guide/features/auth/presentation/widgets/login_view/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_services_locator.dart';
import '../../../../generated/l10n.dart';
import '../../domain/usecases/auth_usecase.dart';
import '../cubits/auth_cubit/auth_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthUseCase>()),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              showToast(msg: S.of(context).loggedInSuccessfully);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MainView()));
            } else if (state is AuthFailure) {
              showSnackBar(context, state.errMessage);
            }
          },
          builder: (context, state) {
            return LoginViewBody();
          },
        ),
      ),
    );
  }
}
