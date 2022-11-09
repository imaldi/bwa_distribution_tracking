part of 'history_scan_cubit.dart';

class HistoryScanCubitState extends Equatable {
  final ScanUserHistoryResponse? scanUserHistoryResponse;
  final ScanUserHistoryResponse? allHistoryResponse;
  final SendScanDataModel? selectedPoint;
  const HistoryScanCubitState({
    this.scanUserHistoryResponse,
    this.allHistoryResponse,
    this.selectedPoint,
  });

  HistoryScanCubitState copyWith({
    ScanUserHistoryResponse? userHistory,
    ScanUserHistoryResponse? allHistory,
    SendScanDataModel? selectedPoint

  }) {
    return HistoryScanCubitState(
      scanUserHistoryResponse: userHistory ?? scanUserHistoryResponse,
      allHistoryResponse: allHistory ?? allHistoryResponse,
      selectedPoint: selectedPoint ?? this.selectedPoint,
    );
  }

  @override
  List<Object?> get props => [scanUserHistoryResponse,allHistoryResponse,selectedPoint];
}
