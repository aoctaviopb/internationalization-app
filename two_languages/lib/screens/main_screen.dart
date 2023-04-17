import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:two_languages/Providers/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switchButton = ref.watch(switchButtonProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.appBar),
        elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.body1),
            Text(AppLocalizations.of(context)!.body2),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('en'),
                Switch(
                  value: switchButton,
                  onChanged: (bool newValue) {
                    ref
                        .read(switchButtonProvider.notifier)
                        .update((state) => state = newValue);

                    ref.read(localeLanguageProvider.notifier).update(
                          (state) => state == const Locale('es')
                              ? state = const Locale('en')
                              : state = const Locale('es'),
                        );
                  },
                ),
                Text('es'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
