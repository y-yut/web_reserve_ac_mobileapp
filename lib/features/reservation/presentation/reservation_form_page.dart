import 'package:flutter/material.dart';

class ReservationFormPage extends StatelessWidget {
  const ReservationFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('予約フォーム')),
      body: const Center(child: Text('予約フォームページ')),
    );
  }
}