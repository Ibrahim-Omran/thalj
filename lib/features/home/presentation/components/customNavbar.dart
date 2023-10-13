import 'package:flutter/material.dart';
import 'package:thalj/core/utils/app_colors.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/utils/app_text_style.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    this.onItemTapped,
    required this.selectedIndex,
  });
  final void Function(int)? onItemTapped;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: boldStyle(fontSize: 12),
      unselectedLabelStyle: boldStyle(fontSize: 12),
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: AppStrings.home,
          activeIcon: Container(
              decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: const Icon(
                Icons.home,
              )),
        ),
        BottomNavigationBarItem(
            icon: const Icon(
              Icons.local_offer_outlined,
            ),
            label: AppStrings.offers,
            activeIcon: Container(
                decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: const Icon(
                  Icons.local_offer_outlined,
                ))),
        BottomNavigationBarItem(
            icon: const Icon(Icons.person_2_outlined),
            label: AppStrings.myProfile,
            activeIcon: Container(
                decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: const Icon(
                  Icons.person_2_outlined,
                ))),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: AppColors.primary,
      onTap: onItemTapped,
    );
  }
}
