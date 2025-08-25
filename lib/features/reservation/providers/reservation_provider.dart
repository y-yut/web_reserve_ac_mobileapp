import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/reservation_repository.dart';
import '../models/reservation.dart';

part 'reservation_provider.g.dart';

@riverpod
Future<List<Reservation>> reservations(ReservationsRef ref) async {
  final repo = ReservationRepository();
  return repo.fetchReservations();
}