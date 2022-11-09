part of 'history_scan_cubit.dart';

class HistoryScanCubitState extends Equatable {
  final ScanUserHistoryResponse? scanUserHistoryResponse;
  final ScanUserHistoryResponse? allHistoryResponse;
  const HistoryScanCubitState({
    this.scanUserHistoryResponse,
    this.allHistoryResponse,
  });

  HistoryScanCubitState copyWith({
    ScanUserHistoryResponse? userHistory,
    ScanUserHistoryResponse? allHistory,
  }) {
    return HistoryScanCubitState(
      scanUserHistoryResponse: userHistory ?? scanUserHistoryResponse,
      allHistoryResponse: allHistory ?? allHistoryResponse,
    );
  }

  @override
  List<Object?> get props => [scanUserHistoryResponse,allHistoryResponse];
}
