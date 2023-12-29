import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/settings/items/language_bottom_sheet.dart';
import 'package:islamic_app/settings/items/setting_item.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';
import 'items/theme_bottom_sheet.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          SettingsItem(
            title: local.language,
            selectedOption: appProvider.currentLocal == 'en' ? local.english : local.arabic,
            onOptionTap: () {
              showLanguageBottomSheet(context);
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          SettingsItem(
            title: local.theme,
            selectedOption: appProvider.isDark()? local.dark : local.light,
            onOptionTap: () {
              showThemeBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheetWidget(),
    );
  }

  // ===================================================
  void showThemeBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ThemeBottomSheetWidget(),
    );
  }
}
