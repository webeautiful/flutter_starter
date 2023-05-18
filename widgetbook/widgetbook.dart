import 'package:flutter/material.dart';
import 'package:flutter_starter/components/custom_bottom_navigation_bar.dart';
import 'package:flutter_starter/components/language_radio.dart';
import 'package:flutter_starter/components/simple_bottom_navigation_bar.dart';
import 'package:flutter_starter/components/theme_radio.dart';
import 'package:flutter_starter/page/home/page.dart';
import 'package:flutter_starter/page/main/page.dart';
import 'package:flutter_starter/page/user/index/page.dart';
import 'package:flutter_starter/page/wallet/page.dart';
import 'package:widgetbook/widgetbook.dart';

class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        WidgetbookCategory(
          name: 'page',
          children: [
            WidgetbookComponent(
              name: 'Main',
              useCases: [
                WidgetbookUseCase(
                  name: 'Main',
                  builder: (context) => const MainPage(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Home',
              useCases: [
                WidgetbookUseCase(
                  name: 'home',
                  builder: (context) => const HomePage(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Wallet',
              useCases: [
                WidgetbookUseCase(
                  name: 'wallet',
                  builder: (context) => const WalletPage(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'User',
              useCases: [
                WidgetbookUseCase(
                  name: 'user',
                  builder: (context) => const UserPage(),
                ),
              ],
            ),
          ],
        ),
        WidgetbookCategory(
          name: '基础组件',
          children: [
            WidgetbookComponent(
              name: '底部导航',
              useCases: [
                WidgetbookUseCase(
                  name: 'simple',
                  builder: (context) => SimpleBottomNavigationBar(
                    currentIndex: context.knobs
                        .number(
                          label: '索引值',
                          initialValue: 0,
                        )
                        .toInt(),
                    onTap: null,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'custom',
                  builder: (context) => CustomBottomNavigationBar(
                    currentIndex: context.knobs
                        .number(
                          label: '当前索引',
                          initialValue: 0,
                          description: '翻页索引',
                        )
                        .toInt(),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookCategory(
          name: '业务组件',
          children: [
            WidgetbookComponent(
              name: '多语言',
              useCases: [
                WidgetbookUseCase(
                  name: 'simple',
                  builder: (context) => const LanguageRadio(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: '多主题',
              useCases: [
                WidgetbookUseCase(
                  name: 'simple',
                  builder: (context) => const ThemeRadio(),
                ),
              ],
            ),
          ],
        ),
      ],
      addons: [
        TextScaleAddon(
          setting: TextScaleSetting(
            activeTextScale: 2,
            textScales: [1, 2],
          ),
        ),
        MaterialThemeAddon(
          setting: ThemeSetting(
            themes: [
              WidgetbookTheme(
                name: 'Dark',
                data: ThemeData.dark(useMaterial3: true),
              ),
              WidgetbookTheme(
                name: 'Light',
                data: ThemeData.light(useMaterial3: true),
              ),
            ],
            activeTheme: WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light(useMaterial3: true),
            ),
          ),
        ),
      ],
      appBuilder: (context, child) => Container(
        child: child,
      ),
    );
  }
}
