import 'package:dry_cleaners/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BusyLoader extends StatefulWidget {
  const BusyLoader({
    super.key,
    this.size = 160,
    this.showbackground = false,
  });
  final double size;
  final bool showbackground;

  @override
  State<BusyLoader> createState() => _BusyLoaderState();
}

class _BusyLoaderState extends State<BusyLoader> with TickerProviderStateMixin {
  late AnimationController controller;
  late final Animation<double> _scaleAnimation;
  int anicount = 0;
  int aniindex = 0;
  bool forward = false;
  bool back = false;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutCubic,
      ),
    );
    controller.addListener(() {
      setState(() {
        if (controller.status == AnimationStatus.forward) {
          forward = true;
        } else if (controller.status == AnimationStatus.reverse) {
          back = true;
        }
        if (forward && back) {
          back = false;
          forward = false;

          if (aniindex >= 3) {
            aniindex = 0;
          } else {
            aniindex++;
          }
        }
      });
    });

    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Container(
          height: widget.size,
          width: widget.size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.showbackground ? AppColors.white : Colors.transparent,
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              SizedBox(
                height: widget.size * 0.3,
                width: widget.size,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AniMatedItem(
                      active: aniindex == 0,
                      size: widget.size,
                    ),
                    AniMatedItem(
                      active: aniindex == 1,
                      size: widget.size,
                    ),
                    AniMatedItem(
                      active: aniindex == 2,
                      size: widget.size,
                    ),
                    AniMatedItem(
                      active: aniindex == 3,
                      size: widget.size,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AniMatedItem extends StatelessWidget {
  const AniMatedItem({
    super.key,
    required this.active,
    required this.size,
  });

  final bool active;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: active ? size * 0.3 : size * 0.1,
      width: size * 0.1,
      decoration: BoxDecoration(
        color: AppColors.goldenButton,
        borderRadius: BorderRadius.circular(size * 0.05),
      ),
      duration: const Duration(milliseconds: 500),
    );
  }
}
