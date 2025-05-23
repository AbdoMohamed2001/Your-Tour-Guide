import 'package:your_tour_guide/components.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/screens/homePage/main_view.dart';
import 'package:your_tour_guide/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../widgets/social_buttons.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  static String id = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..bundle(),
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
              elevation: 0,
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainView()));
              } else if (state is AuthFailure) {
                showSnackBar(context, state.errMessage);
              }
            },
            builder: (context, state) {
              var AuthCubitClass = AuthCubit.get(context);

              return ModalProgressHUD(
                inAsyncCall: state is AuthLoading ? true : false,
                child: Form(
                  key: AuthCubitClass.registerFormKey,
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                                ),
                              ],
                            ),
                          ),
                          //-----------------Image--------------------------
                          Stack(
                            children: [
                              AuthCubitClass.image != null
                                  ? CircleAvatar(
                                      backgroundColor: Colors.white10,
                                      radius: 64,
                                      backgroundImage:
                                          MemoryImage(AuthCubitClass.image!),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.white10,
                                      radius: 60,
                                      backgroundImage: NetworkImage(
                                        'https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg',
                                      ),
                                    ),
                              Positioned(
                                bottom: -10,
                                left: 80,
                                child: IconButton(
                                  onPressed: () {
                                    AuthCubitClass.selectImage();

                                    // selectImage();
                                  },
                                  icon: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // ---------------------UserName-----------------------------
                          kSizedBox20,
                          CustomTextField(
                            controller:
                                AuthCubitClass.registerUserNameController,
                            labelText: S.of(context).UserName,
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-zA-Z\d_-].{3,30}$')
                                      .hasMatch(value)) {
                                return S.of(context).EnterCorrectUserName;
                              }
                              // userName = value;
                              return null;
                            },
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            textInputType: TextInputType.text,
                          ),
                          kSizedBox20,
                          // ---------------------Email-----------------------------
                          CustomTextField(
                            controller: AuthCubitClass.registerEmailController,
                            labelText: S.of(context).Email,
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^([a-z\d_.-]+)@([\da-z.-]+)\.([a-z.]{2,63})$')
                                      .hasMatch(value)) {
                                return S.of(context).EnterCorrectEmail;
                              }
                              // emailAddress = value;
                              return null;
                            },
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                            textInputType: TextInputType.text,
                          ),
                          kSizedBox20,
                          // --------------------Password-----------------------------
                          CustomTextField(
                            controller:
                                AuthCubitClass.registerPasswordController,
                            labelText: S.of(context).Password,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^.{8,}$').hasMatch(value)) {
                                return S
                                    .of(context)
                                    .PasswordMustBeAtLeast8Characters;
                              }
                              AuthCubitClass.passwordValue = value;
                              return null;
                            },
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Colors.grey,
                            ),
                            textInputType: TextInputType.visiblePassword,
                          ),
                          kSizedBox20,
                          // ----------------ConfirmPassword-----------------------------
                          CustomTextField(
                            controller: AuthCubitClass
                                .registerConfirmPasswordController,
                            labelText: S.of(context).ConfirmPassword,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  value != AuthCubitClass.passwordValue) {
                                return S.of(context).passwordNotMatched;
                              }
                              AuthCubitClass.password = value;
                              return null;
                            },
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Colors.grey,
                            ),
                            textInputType: TextInputType.visiblePassword,
                          ),
                          kSizedBox20,
                          //-------------------------------------------------------------------
                          //OR Widget
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Divider(
                                  height: 2,
                                  color: Colors.orange,
                                  thickness: 1,
                                  endIndent: 4,
                                  indent: 25,
                                ),
                              ),
                              Text(
                                'OR',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  height: 2,
                                  color: Colors.orange,
                                  thickness: 1,
                                  endIndent: 25,
                                  indent: 4,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //-------------------------------------------------------------------
                          SocialButtons(),
                          SizedBox(
                            height: 50,
                          ),
                          //-------------------------------------------------------------
                          //Sign Up Button
                          GestureDetector(
                            onTap: () async {
                              if (AuthCubitClass.registerFormKey.currentState!
                                  .validate()) {
                                if (AuthCubitClass.image == null) {
                                  AuthCubitClass.makeDefaultImage();
                                }
                                await AuthCubitClass.signUpUser(
                                  context: context,
                                  email: AuthCubitClass
                                      .registerEmailController.text,
                                  password: AuthCubitClass
                                      .registerPasswordController.text,
                                  userName: AuthCubitClass
                                      .registerUserNameController.text,
                                  file: AuthCubitClass.image!,
                                );
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                width: double.infinity,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    S.of(context).SIGNUP,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //-------------------------------------------------------------
                          kSizedBox,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  S.of(context).AlreadyHaveAccount,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    S.of(context).SignIn,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
