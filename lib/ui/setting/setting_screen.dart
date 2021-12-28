import 'package:flutter/material.dart';
import 'package:possystem/components/scaffold/item_list_scaffold.dart';
import 'package:possystem/components/style/card_tile.dart';
import 'package:possystem/components/style/pop_button.dart';
import 'package:possystem/constants/constant.dart';
import 'package:possystem/settings/cashier_warning.dart';
import 'package:possystem/settings/language_setting.dart';
import 'package:possystem/settings/order_awakening_setting.dart';
import 'package:possystem/settings/order_outlook_setting.dart';
import 'package:possystem/settings/order_product_axis_count_setting.dart';
import 'package:possystem/settings/settings_provider.dart';
import 'package:possystem/settings/theme_setting.dart';
import 'package:possystem/translator.dart';
import 'package:possystem/ui/setting/widgets/feature_slider.dart';
import 'package:possystem/ui/setting/widgets/feature_switch.dart';

const _languageNames = ['繁體中文', 'English'];

const _supportedLanguages = ['zh', 'en'];

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = SettingsProvider.of<ThemeSetting>();
    final language = SettingsProvider.of<LanguageSetting>();
    final orderAwakening = SettingsProvider.of<OrderAwakeningSetting>();
    final orderOutlook = SettingsProvider.of<OrderOutlookSetting>();
    final orderCount = SettingsProvider.of<OrderProductAxisCountSetting>();
    final cashierWarning = SettingsProvider.of<CashierWarningSetting>();

    final selectedLanguage =
        _supportedLanguages.indexOf(language.value.languageCode);

    return Scaffold(
      appBar: AppBar(leading: const PopButton()),
      body: ListView(
        children: <Widget>[
          CardTile(
            key: const Key('setting.theme'),
            title: Text(S.settingThemeTitle),
            subtitle: Text(S.settingThemeTypes(theme.value)),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            onTap: () => _navigateItemList(
              (index) => theme.update(ThemeMode.values[index]),
              title: S.settingThemeTitle,
              items: ThemeMode.values
                  .map<String>((e) => S.settingThemeTypes(e))
                  .toList(),
              selected: theme.value.index,
            ),
          ),
          CardTile(
            key: const Key('setting.language'),
            title: Text(S.settingLanguageTitle),
            subtitle: Text(_languageNames[selectedLanguage]),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            onTap: () => _navigateItemList(
              (index) => language.update(Locale(_supportedLanguages[index])),
              title: S.settingLanguageTitle,
              selected: selectedLanguage,
              items: _languageNames,
            ),
          ),
          const SizedBox(height: kSpacing2),
          CardTile(
            key: const Key('setting.outlook_order'),
            title: Text(S.settingOrderOutlookTitle),
            subtitle: Text(S.settingOrderOutlookTypes(orderOutlook.value)),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            onTap: () => _navigateItemList(
              (index) => orderOutlook.update(OrderOutlookTypes.values[index]),
              title: S.settingOrderOutlookTitle,
              items: OrderOutlookTypes.values
                  .map((e) => S.settingOrderOutlookTypes(e))
                  .toList(),
              selected: orderOutlook.value.index,
            ),
          ),
          CardTile(
            key: const Key('setting.cashier_warning'),
            title: Text(S.settingCashierWarningTitle),
            subtitle: Text(S.settingCashierWarningTypes(cashierWarning.value)),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            onTap: () => _navigateItemList(
              (index) =>
                  cashierWarning.update(CashierWarningTypes.values[index]),
              title: S.settingCashierWarningTitle,
              items: CashierWarningTypes.values
                  .map((e) => S.settingCashierWarningTypes(e))
                  .toList(),
              selected: cashierWarning.value.index,
            ),
          ),
          FeatureSlider(
            sliderKey: const Key('setting.order_product_count'),
            title: '點餐時每行顯示幾個產品',
            value: orderCount.value,
            max: 5,
            minLabel: '純文字顯示',
            hintText: '設定「零」則點餐時僅會以文字顯示',
            onChanged: (value) => orderCount.update(value),
          ),
          CardTile(
            title: Text(S.settingOrderAwakeningTitle),
            trailing: FeatureSwitch(
              key: const Key('setting.awake_ordering'),
              value: orderAwakening.value,
              onChanged: (value) => orderAwakening.update(value),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateItemList(
    Future<void> Function(int) onChanged, {
    required String title,
    required List<String> items,
    required int selected,
  }) async {
    final newSelected = await Navigator.of(context).push<int>(
      MaterialPageRoute(
          builder: (_) => ItemListScaffold(
                title: title,
                items: items,
                selected: selected,
              )),
    );

    if (newSelected != null) {
      await onChanged(newSelected);
      setState(() {});
    }
  }
}
