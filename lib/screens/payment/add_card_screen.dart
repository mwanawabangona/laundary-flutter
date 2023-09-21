import 'package:dry_cleaners/constants/app_box_decoration.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/constants/input_field_decorations.dart';
import 'package:dry_cleaners/misc/misc_global_variables.dart';
import 'package:dry_cleaners/providers/cards_providedr.dart';
import 'package:dry_cleaners/utils/card_input_formatter.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/widgets/buttons/full_width_button.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:dry_cleaners/widgets/nav_bar.dart';
import 'package:dry_cleaners/widgets/screen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddCardScreen extends ConsumerWidget {
  AddCardScreen({super.key});
  final List<FocusNode> _fNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenWrapper(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            decoration: AppBoxDecorations.topBarv2,
            height: 88.h,
            width: 375.w,
            child: Column(
              children: [
                AppSpacerH(43.h),
                AppNavbar(
                  title: 'Add A New Card',
                  onBack: () {
                    context.nav.pop();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: FormBuilder(
                key: _formkey,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    AppSpacerH(15.h),
                    const FormLabel(labeltext: 'Card Number'),
                    AppSpacerH(10.h),
                    FormBuilderTextField(
                      focusNode: _fNodes[0],
                      name: 'number',
                      keyboardType: TextInputType.number,
                      decoration: AppInputDecor.loginPageInputDecor,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(19),
                        CardNumberInputFormatter(),
                      ],
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.creditCard(),
                          FormBuilderValidators.required()
                        ],
                      ),
                    ),
                    AppSpacerH(15.h),
                    const FormLabel(labeltext: 'Name'),
                    AppSpacerH(10.h),
                    FormBuilderTextField(
                      focusNode: _fNodes[1],
                      name: 'name',
                      decoration: AppInputDecor.loginPageInputDecor,
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()],
                      ),
                    ),
                    AppSpacerH(15.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FormLabel(labeltext: 'Expire Month'),
                              AppSpacerH(10.h),
                              FormBuilderTextField(
                                focusNode: _fNodes[2],
                                name: 'exp_month',
                                decoration: AppInputDecor.loginPageInputDecor
                                    .copyWith(hintText: "mm"),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textInputAction: TextInputAction.next,
                                validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()],
                                ),
                              ),
                            ],
                          ),
                        ),
                        AppSpacerW(10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FormLabel(labeltext: 'Expire Year'),
                              AppSpacerH(10.h),
                              FormBuilderTextField(
                                focusNode: _fNodes[3],
                                name: 'exp_year',
                                decoration: AppInputDecor.loginPageInputDecor
                                    .copyWith(hintText: "yyyy"),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textInputAction: TextInputAction.next,
                                validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()],
                                ),
                              ),
                            ],
                          ),
                        ),
                        AppSpacerW(10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FormLabel(labeltext: 'CVC'),
                              AppSpacerH(10.h),
                              FormBuilderTextField(
                                focusNode: _fNodes[4],
                                name: 'cvc',
                                decoration: AppInputDecor.loginPageInputDecor
                                    .copyWith(hintText: "123"),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textInputAction: TextInputAction.go,
                                validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    AppSpacerH(15.h),
                    const FormLabel(labeltext: 'Country'),
                    AppSpacerH(10.h),
                    FormBuilderTextField(
                      initialValue: "United Kingdom",
                      focusNode: _fNodes[5],
                      name: 'country',
                      readOnly: true,
                      decoration: AppInputDecor.loginPageInputDecor,
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()],
                      ),
                    ),
                    AppSpacerH(15.h),
                    const FormLabel(labeltext: 'Postcode'),
                    AppSpacerH(10.h),
                    FormBuilderTextField(
                      focusNode: _fNodes[6],
                      name: 'postcode',
                      decoration: AppInputDecor.loginPageInputDecor,
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()],
                      ),
                    ),
                    AppSpacerH(50.h),
                    ref.watch(cardSaveProvider).map(
                          initial: (_) => AppTextButton(
                            title: 'Confirm',
                            onTap: () {
                              for (final element in _fNodes) {
                                if (element.hasFocus) {
                                  element.unfocus();
                                }
                              }
                              if (_formkey.currentState!.saveAndValidate()) {
                                final String cardNumber = _formkey.currentState!
                                    .fields['number']!.value as String;

                                final formData = {
                                  ..._formkey.currentState!.value,
                                  'number': cardNumber.replaceAll(" ", "")
                                };
                                debugPrint(formData.toString());

                                ref
                                    .watch(cardSaveProvider.notifier)
                                    .saveCard(data: formData);
                              }
                            },
                          ),
                          loading: (_) => const LoadingWidget(),
                          loaded: (_) {
                            Future.delayed(transissionDuration).then((value) {
                              ref.refresh(cardSaveProvider);
                              ref.refresh(allCardsProvider);
                              context.nav.pop();
                            });
                            return const MessageTextWidget(msg: "Success");
                          },
                          error: (_) {
                            Future.delayed(transissionDuration).then((value) {
                              ref.refresh(cardSaveProvider);
                            });
                            return ErrorTextWidget(error: _.error);
                          },
                        )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FormLabel extends StatelessWidget {
  const FormLabel({
    super.key,
    required this.labeltext,
  });
  final String labeltext;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: labeltext,
            style: AppTextDecor.osBold12black,
          ),
          TextSpan(text: '*', style: AppTextDecor.osBold12red),
        ],
      ),
    );
  }
}
