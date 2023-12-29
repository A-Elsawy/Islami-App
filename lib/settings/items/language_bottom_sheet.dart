import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/settings/items/selected_option.dart';
import 'package:islamic_app/settings/items/unselected_option.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class LanguageBottomSheetWidget extends StatelessWidget {
  const LanguageBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
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
              appProvider.changeLanguage('en');
              Navigator.pop(context);
            },
            child: appProvider.currentLocal == 'en'
                ? SelectedOptionWidget(selectedTitle: local.english)
                : UnSelectedOptionWidget(unSelectedTitle: local.english),
          ),
          const SizedBox(
            height: 30.0,
          ),
          GestureDetector(
            onTap: () {
              appProvider.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: appProvider.currentLocal == 'ar'
                ? SelectedOptionWidget(selectedTitle: local.arabic)
                : UnSelectedOptionWidget(unSelectedTitle: local.arabic),
          ),
        ],
      ),
    );
  }
}
