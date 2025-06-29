import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home/home_screen.dart';
import 'core/theme/app_theme.dart';
import 'core/extensions/context.dart';
import 'utils/shared-preferences/shared_preferences_provider.dart';
import 'package:weather/l10n/app_localizations.dart';

import 'utils/theme-controller/theme_controller_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  final sharedPrefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(sharedPrefs)],
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends ConsumerWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme(fontFamily: 'Satoshi');

    return MaterialApp(
      onGenerateTitle: (context) => context.l10n.appTitle,
      theme: appTheme.light(),
      darkTheme: appTheme.dark(),
      themeMode: ref.watch(themeControllerProvider),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
    );
  }
}
