import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/generated/l10n.dart';
import 'package:dry_cleaners/screens/payment/payment_controller.dart';
import 'package:dry_cleaners/utils/context_less_nav.dart';
import 'package:dry_cleaners/utils/routes.dart';
import 'package:dry_cleaners/widgets/buttons/full_width_button.dart';
import 'package:dry_cleaners/widgets/misc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key, required this.details});
  final Map<String, dynamic> details;

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  bool isPaid = false;
  bool isCOD = false;
  bool isMakingPayment = false;
  @override
  void initState() {
    super.initState();
    isCOD = widget.details['isCOD'] as bool;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 88.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/order_success.png',
              width: 335.w,
              height: 281.h,
            ),
            AppSpacerH(30.h),
            Text(
              '${S.of(context).urordrhsbnplcd} ${(isCOD || isPaid) ? S.of(context).cnfrmd : S.of(context).plcdplsmkpymnttocnfrmit}',
              style: AppTextDecor.osSemiBold18black,
              textAlign: TextAlign.center,
            ),
            AppSpacerH(10.h),
            Text(
              '${S.of(context).urordrid} #${widget.details['id']} ',
              style: AppTextDecor.osRegular18black,
              textAlign: TextAlign.center,
            ),
            AppSpacerH(111.h),
            AppTextButton(
              title: (isCOD || isPaid)
                  ? S.of(context).gotohome
                  : S.of(context).mkpymnt,
              onTap: () async {
                if (isCOD || isPaid) {
                  context.nav.pushNamedAndRemoveUntil(
                    Routes.homeScreen,
                    (route) => false,
                  );
                } else {
                  if (!isMakingPayment) {
                    isMakingPayment = true;
                    final PaymentController pay = PaymentController(

                    );

                    isPaid = 
                    await pay.makePayment(
                      amount: widget.details['amount'] as String,
                      currency: 'GBP',
                      couponID: widget.details['couponID'] as String?,
                      orderID: widget.details['id'] as String,
                    );
                    isMakingPayment = false;
                    setState(() {});
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
