import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/input_field_decorations.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/misc/misc_global_variables.dart';
import 'package:dry_cleaners/providers/auth_provider.dart';
import 'package:dry_cleaners/screens/auth/login_screen_wrapper.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/utils/routes.dart';
import 'package:dry_cleaners/widgets/buttons/full_width_button.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:dry_cleaners/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RecoverPasswordStageThree extends StatefulWidget {
  const RecoverPasswordStageThree({super.key, required this.token});

  @override
  State<RecoverPasswordStageThree> createState() =>
      _RecoverPasswordStageThreeState();

  final String token;
}

class _RecoverPasswordStageThreeState extends State<RecoverPasswordStageThree> {
  final List<FocusNode> fNodes = [FocusNode(), FocusNode()];
  bool obsecureTextOne = true;
  bool obsecureTextTwo = true;

  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return LoginScreenWrapper(
      child: SingleChildScrollView(
        child: FormBuilder(
          key: _formkey,
          child: Container(
            padding: EdgeInsets.fromLTRB(20.w, 44.h, 20.w, 0),
            height: 812.h,
            width: 375.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppNavbar(
                  onBack: () {
                    context.nav.pop();
                  },
                ),
                Text(
                  S.of(context).crtnwpswrd,
                  style: AppTextDecor.osBold30black,
                ),
                AppSpacerH(5.h),
                Text(
                  S.of(context).crturnwpswrd,
                  style: AppTextDecor.osRegular18black,
                ),
                AppSpacerH(44.h),
                Expanded(
                  child: Column(
                    children: [
                      AppSpacerH(33.h),
                      FormBuilderTextField(
                        focusNode: fNodes[0],
                        name: 'password',
                        obscureText: obsecureTextOne,
                        decoration: AppInputDecor.loginPageInputDecor.copyWith(
                          hintText: S.of(context).password,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obsecureTextOne = !obsecureTextOne;
                              });
                            },
                            child: Icon(
                              obsecureTextOne
                                  ? Icons.visibility
                                  : Icons.visibility_off_outlined,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()],
                        ),
                      ),
                      AppSpacerH(33.h),
                      FormBuilderTextField(
                        focusNode: fNodes[1],
                        name: 'password2',
                        obscureText: obsecureTextTwo,
                        decoration: AppInputDecor.loginPageInputDecor.copyWith(
                          hintText: S.of(context).pswrdagn,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obsecureTextTwo = !obsecureTextTwo;
                              });
                            },
                            child: Icon(
                              obsecureTextTwo
                                  ? Icons.visibility
                                  : Icons.visibility_off_outlined,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()],
                        ),
                      ),
                      AppSpacerH(51.h),
                      SizedBox(
                        height: 50.h,
                        child: Consumer(
                          builder: (context, ref, child) {
                            return ref.watch(forgotPassResetPassProvider).map(
                              error: (_) {
                                Future.delayed(transissionDuration)
                                    .then((value) {
                                  ref.refresh(forgotPassResetPassProvider);
                                });
                                return ErrorTextWidget(error: _.error);
                              },
                              initial: (_) {
                                return AppTextButton(
                                  buttonColor: AppColors.goldenButton,
                                  title: S.of(context).rstpswrd,
                                  titleColor: AppColors.white,
                                  onTap: () {
                                    for (final element in fNodes) {
                                      if (element.hasFocus) {
                                        element.unfocus();
                                      }
                                    }

                                    if (_formkey.currentState != null &&
                                        _formkey.currentState!
                                            .saveAndValidate()) {
                                      final formData =
                                          _formkey.currentState!.fields;
                                      ref
                                          .watch(
                                            forgotPassResetPassProvider
                                                .notifier,
                                          )
                                          .resetPassword(
                                            formData['password']!.value
                                                as String,
                                            formData['password2']!.value
                                                as String,
                                            widget.token,
                                          );
                                    }
                                  },
                                );
                              },
                              loaded: (_) {
                                Future.delayed(transissionDuration)
                                    .then((value) {
                                  ref.refresh(
                                    forgotPassResetPassProvider,
                                  ); //Refresh This so That App Doesn't Auto Login

                                  Future.delayed(buildDuration).then((value) {
                                    context.nav.pushNamedAndRemoveUntil(
                                      Routes.loginScreen,
                                      (route) => false,
                                    );
                                  });
                                });
                                return MessageTextWidget(
                                  msg: S.of(context).scs,
                                );
                              },
                              loading: (_) {
                                return const LoadingWidget();
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
