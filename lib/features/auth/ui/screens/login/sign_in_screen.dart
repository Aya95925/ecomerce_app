import 'package:ecomerce_app/core/di/di.dart';
import 'package:ecomerce_app/core/utils/assets_manager.dart';
import 'package:ecomerce_app/core/utils/color_manager.dart';
import 'package:ecomerce_app/core/utils/font_manager.dart';
import 'package:ecomerce_app/core/utils/resources.dart';
import 'package:ecomerce_app/core/utils/styles_manager.dart';
import 'package:ecomerce_app/core/utils/values_manager.dart';
import 'package:ecomerce_app/core/routes_manager/routes.dart';
import 'package:ecomerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecomerce_app/core/widget/main_text_field.dart';
import 'package:ecomerce_app/core/widget/validators.dart';
import 'package:ecomerce_app/features/auth/ui/screens/login/cubit/login_cubit.dart';
import 'package:ecomerce_app/features/auth/ui/screens/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordContrroler = TextEditingController();
  var cubit = gitIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.apiLogin.status == ApiStatus.success) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.mainRoute,
            (route) => false,
          );
        } else if (state.apiLogin.status == ApiStatus.error) {
          Fluttertoast.showToast(
            msg: state.apiLogin.error ?? '',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.s40.h),
                  Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                  SizedBox(height: AppSize.s40.h),
                  Text(
                    'Welcome Back To Route',
                    style: getBoldStyle(
                      color: ColorManager.white,
                    ).copyWith(fontSize: FontSize.s24.sp),
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: getLightStyle(
                      color: ColorManager.white,
                    ).copyWith(fontSize: FontSize.s16.sp),
                  ),
                  SizedBox(height: AppSize.s50.h),
                  BuildTextField(
                    backgroundColor: ColorManager.white,
                    hint: 'enter your email',
                    label: 'your email',
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateEmail,
                    controller: emailController,
                  ),
                  SizedBox(height: AppSize.s28.h),
                  BuildTextField(
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'Password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                    controller: passwordContrroler,
                  ),
                  SizedBox(height: AppSize.s8.h),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forget password?',
                          style: getMediumStyle(
                            color: ColorManager.white,
                          ).copyWith(fontSize: FontSize.s18.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s60.h),
                  Center(
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * .8,
                      child: BlocBuilder<LoginCubit, LoginState>(
                        bloc: cubit,

                        builder: (context, state) {
                          if (state.apiLogin.status == ApiStatus.loading) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 14.h,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(17.r),
                              ),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.darkBlue,
                                ),
                              ),
                            );
                          } else {
                            return CustomElevatedButton(
                              isStadiumBorder: false,
                              label: 'Login',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s18,
                              ),
                              onTap: () {
                                cubit.login(
                                  emailController.text,
                                  passwordContrroler.text,
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: getSemiBoldStyle(
                          color: ColorManager.white,
                        ).copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(width: AppSize.s8.w),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.signUpRoute),
                        child: Text(
                          'Create Account',
                          style: getSemiBoldStyle(
                            color: ColorManager.white,
                          ).copyWith(fontSize: FontSize.s16.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
