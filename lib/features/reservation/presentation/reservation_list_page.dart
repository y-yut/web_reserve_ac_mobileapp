import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/reservation_provider.dart';

class ReservationListPage extends ConsumerWidget {
  const ReservationListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncReservations = ref.watch(reservationsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('予約一覧')),
      body: asyncReservations.when(
        data: (reservations) => ListView.builder(
          itemCount: reservations.length,
          itemBuilder: (context, index) {
            final reservation = reservations[index];
            return ListTile(
              title: Text(reservation.name),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('エラー: $e')),
      ),
    );
  }
}