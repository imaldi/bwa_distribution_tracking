import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:dartz/dartz.dart';

/// Kenapa pakai type parameter P untuk Params?
/// Supaya semua kelas yang meng-extends UseCase bisa override call dengan jumlah parameter yang berbeda
/// misal loginRepository.login(LoginParams(phoneNumber, password)
/// lalu loginRepository.logout(NoParams())
abstract class UseCase<Type, P> {
  Future<Either<Failure, Type>> call(P params);
}
