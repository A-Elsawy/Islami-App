import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

typedef SettingsOptionClicked = void Function();

class SettingsItem extends StatelessWidget {
  final String title, selectedOption;
  final Function onOptionTap;

  const SettingsItem(
      {super.key,
      required this.title,
      required this.selectedOption,
      required this.onOptionTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: theme.textTheme.bodyLarge,
        ),
        GestureDetector(
          onTap: () {
            onOptionTap();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: mediaQuery.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: appProvider.toggle(),
                width: 1.2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedOption),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: appProvider.toggle(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
