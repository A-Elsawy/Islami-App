import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/settings/items/selected_option.dart';
import 'package:islamic_app/settings/items/unselected_option.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class ThemeBottomSheetWidget extends StatelessWidget {
  const ThemeBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              appProvider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: appProvider.isDark()
                ? UnSelectedOptionWidget(unSelectedTitle: local.light)
                : SelectedOptionWidget(selectedTitle: local.light),
          ),
          const SizedBox(
            height: 30.0,
          ),
          GestureDetector(
            onTap: () {
              appProvider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: appProvider.isDark()
                ? SelectedOptionWidget(selectedTitle: local.dark)
                : UnSelectedOptionWidget(unSelectedTitle: local.dark),
          ),
        ],
      ),
    );
  }
}
