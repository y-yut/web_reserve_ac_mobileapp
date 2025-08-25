import 'package:flutter/material.dart';

class ReservationDetailPage extends StatelessWidget {
  const ReservationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('予約詳細')),
      body: const Center(child: Text('予約詳細ページ')),
    );
  }
}