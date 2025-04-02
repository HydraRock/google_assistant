import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:siri_google_assistent/dossiers.dart';
import 'package:siri_google_assistent/main.dart';

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      Uri uri = Uri.tryParse(settings.name ?? "") ?? Uri();

      // Log dettagliato per debug
      log('Parsed URI: $uri', name: 'MainRouter');
      log('URI scheme: ${uri.scheme}', name: 'MainRouter');
      log('URI host: ${uri.host}', name: 'MainRouter');
      log('URI path: ${uri.path}', name: 'MainRouter');
      log('URI queryParameters: ${uri.queryParameters}', name: 'MainRouter');

      // Gestione del deep link "notaio://open/dossiers"
      if (uri.path == '/dossiers') {
        String? dossierName = uri.queryParameters['name'];

        log('Navigating to Dossiers with name: $dossierName',
            name: 'MainRouter');

        return MaterialPageRoute(
          builder: (_) => Dossiers(dossierName: dossierName),
        );
      }

// Gestione del deep link "notaio://open"
      if (uri.path.isEmpty || uri.path == '/') {
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }

      // Gestione rotte normali
      switch (settings.name) {
        case '/dossiers':
          return MaterialPageRoute(builder: (_) => const Dossiers());
        default:
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('Nessuna rotta definita per ${settings.name}'),
              ),
            ),
          );
      }
    } catch (e, stackTrace) {
      log('Errore durante la navigazione: $e',
          name: 'MainRouter', error: e, stackTrace: stackTrace);
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('Errore durante la navigazione: $e'),
          ),
        ),
      );
    }
  }
}
