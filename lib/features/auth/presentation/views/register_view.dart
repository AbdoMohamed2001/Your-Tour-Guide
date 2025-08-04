import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/features/auth/domain/usecases/auth_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/auth/presentation/widgets/register_view/register_view_consumer.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../cubits/auth_cubit/auth_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthUseCase>()),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: RegisterViewConsumer(),
      ),
    );
  }
}
