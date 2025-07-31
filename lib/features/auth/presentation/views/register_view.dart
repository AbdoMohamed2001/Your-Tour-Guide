import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/features/auth/domain/usecases/is_logged_use_case.dart';
import 'package:your_tour_guide/features/auth/domain/usecases/login_usecase.dart';
import 'package:your_tour_guide/features/auth/domain/usecases/login_with_facebook_usecase.dart';
import 'package:your_tour_guide/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:your_tour_guide/features/auth/domain/usecases/register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/auth/presentation/widgets/register_view/register_view_consumer.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../cubits/auth_cubit/auth_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  static String id = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        getIt<LoginUseCase>(),
        getIt<LoginWithFacebookUseCase>(),
        getIt<LoginWithGoogleUseCase>(),
        getIt<RegisterUseCase>(),
        getIt<IsLoggedUseCase>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: RegisterViewConsumer(),
      ),
    );
  }
}
