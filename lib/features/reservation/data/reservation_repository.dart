import '../models/reservation.dart';

class ReservationRepository {
  Future<List<Reservation>> fetchReservations() async {
    // 仮データ
    return [
      Reservation(id: '1', name: '予約A'),
      Reservation(id: '2', name: '予約B'),
    ];
  }
}