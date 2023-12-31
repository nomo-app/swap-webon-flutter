import 'package:flutter/material.dart';
import 'package:nomo_router/router/entities/route.dart';
import 'package:nomo_ui_kit/components/app/app_bar/nomo_app_bar.dart';
import 'package:nomo_ui_kit/components/app/scaffold/nomo_scaffold.dart';
import 'package:nomo_ui_kit/nomo_ui_kit_base.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/theme_provider.dart';
import 'package:route_gen/anotations.dart';
import 'package:swapping_webon/pages/swapping_screen.dart';
import 'package:swapping_webon/theme/theme.dart';

part 'routes.g.dart';

Widget wrapper(nav) {
  return Builder(
    builder: (context) {
      final themeProvider = ThemeProvider.of(context);
      return NomoScaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(context.componentSizes.appBarTheme.height),
          child: NomoAppBar(
            leading: Text(
              "Swap",
              style: context.typography.h3,
            ),
            trailling: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (themeProvider.colorTheme == ColorMode.DARK.theme)
                  IconButton(
                    onPressed: () {
                      ThemeProvider.of(context).changeColorTheme(
                        ColorMode.LIGHT.theme,
                      );
                    },
                    icon: const Icon(
                      Icons.light_mode,
                      color: Colors.white,
                    ),
                  )
                else
                  IconButton(
                    onPressed: () {
                      ThemeProvider.of(context).changeColorTheme(
                        ColorMode.DARK.theme,
                      );
                    },
                    icon: const Icon(
                      Icons.dark_mode,
                    ),
                  ),
              ],
            ),
          ),
        ),
        child: nav,
      );
    },
  );
}

@AppRoutes()
const _routes = [
  MenuNestedPageRouteInfo(
    wrapper: wrapper,
    path: "/",
    page: SwappingScreen,
    title: "Swapping Screen",
  ),
];
