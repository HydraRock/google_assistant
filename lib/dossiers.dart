import 'package:flutter/material.dart';

class Dossiers extends StatelessWidget {
  final String? dossierName;

  const Dossiers({super.key, this.dossierName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dossiers'),
      ),
      body: Center(
        child: Text(
          dossierName != null
              ? 'Aperto dossier: $dossierName'
              : 'Nessun dossier selezionato',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
