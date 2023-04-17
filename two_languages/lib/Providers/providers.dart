import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeLanguageProvider = StateProvider<Locale>(
  (ref) {
    return const Locale('es');
  },
);


final switchButtonProvider = StateProvider<bool>(
  (ref) {
    return true;
  },
);
