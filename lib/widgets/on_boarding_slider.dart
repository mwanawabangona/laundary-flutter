// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dry_cleaners/constants/app_text_decor.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/screens/onBoarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoadringImageSlider extends StatelessWidget {
  const OnBoadringImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return SizedBox(
          height: 320.h,
          width: 250.w,
          child: PageView(
            controller: ref.watch(onBoardingSliderControllerProvider('image')),
            children: slideData
                .map(
                  (e) => Image.asset(
                    e.image,
                  ),
                )
                .toList(),
            onPageChanged: (val) {
              ref
                  .watch(onBoardingSliderControllerProvider('text'))
                  .animateToPage(
                    val,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
              ref.watch(onBoardingSliderIndexProvider.notifier).state = val;
            },
          ),
        );
      },
    );
  }
}

class OnBoadringTextSlider extends StatelessWidget {
  const OnBoadringTextSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return SizedBox(
          height: 130.h,
          width: 335.w,
          child: PageView(
            controller: ref.watch(onBoardingSliderControllerProvider('text')),
            physics: const NeverScrollableScrollPhysics(),
            children: slideData
                .map(
                  (e) => Text(
                    e.text,
                    textAlign: TextAlign.center,
                    style: AppTextDecor.osBold24black,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
