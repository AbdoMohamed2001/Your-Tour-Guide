import 'package:your_tour_guide/components.dart';
import 'package:your_tour_guide/screens/homePage/main_view.dart';
import 'package:your_tour_guide/features/auth/presentation/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_cubit/auth_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);
  static String id = 'LoginView';

  @override
  Widget build(BuildContext context) {
    // var AuthCubitClass = BlocProvider.of<AuthCubit>(context);
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/wallpaper.jpg'),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(-0.5),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.2,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Color(0xff272938),
              ),
            ),
          ),
          body: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AuthSuccess) {
                showToast(msg: 'logged in Successfully');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainView()));
              } else if (state is AuthFailure) {
                showSnackBar(context, state.errMessage);
              }
            },
            builder: (context, state) {
              return LoginViewBody();
            },
          ),
        ),
      ),
    );
  }
}
