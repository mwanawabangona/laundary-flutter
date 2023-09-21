import 'package:dry_cleaners/constants/hive_contants.dart';
import 'package:dry_cleaners/providers/misc_providers.dart';
import 'package:dry_cleaners/providers/profile_update_provider.dart';
import 'package:dry_cleaners/providers/settings_provider.dart';
import 'package:dry_cleaners/screens/cart/my_cart_tab.dart';
import 'package:dry_cleaners/screens/homePage/home_tab.dart';
import 'package:dry_cleaners/screens/homePage/my_notfications_tab.dart';
import 'package:dry_cleaners/screens/homePage/tab_profile_unsigned.dart';
import 'package:dry_cleaners/screens/order/my_orders_tab.dart';
import 'package:dry_cleaners/widgets/home_screen_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingsProvider);
    ref.watch(profileInfoProvider).maybeWhen(
          orElse: () {},
          loaded: (_) {
            final Box userBox = Hive.box(AppHSC.userBox);
            userBox.put(AppHSC.stripeCustomerID, _.data?.customer?.stripeId);
          },
        );
    return HomeScreenWrapper(
      child: PageView(
        controller: ref.watch(homeScreenPageControllerProvider),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          MyCartTab(),
          const MyOrdersTab(),
          MyNotificationsTab(),
          const UsignedUserTab(),
          HomeTab(),
        ],
      ),
    );
  }
}
