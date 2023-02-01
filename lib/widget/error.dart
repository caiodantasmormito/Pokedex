// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({
    Key? key,
    this.error,
  }) : super(key: key);
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Text(error ?? 'Não foi possível carregar os dados'),
      ),
    );
  }
}
