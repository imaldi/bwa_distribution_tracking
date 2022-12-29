part of 'history_scan_bloc.dart';

@immutable
abstract class HistoryScanState extends Equatable {
  const HistoryScanState();
}

class HistoryScanInitial extends HistoryScanState {
  @override
  List<Object?> get props => [];
}

class HistoryScanLoading extends HistoryScanState {
  @override
  List<Object?> get props => [];
}

class UserHistoryScanLoaded extends HistoryScanState {
  final ScanUserHistoryResponse scanUserHistoryResponse;
  const UserHistoryScanLoaded(
      this.scanUserHistoryResponse
      );
  @override
  List<Object?> get props => [scanUserHistoryResponse];
}

class AllHistoryScanLoaded extends HistoryScanState {
  final ScanUserHistoryResponse scanAllHistoryResponse;
  const AllHistoryScanLoaded(
      this.scanAllHistoryResponse
      );
  @override
  List<Object?> get props => [scanAllHistoryResponse];
}

class HistoryPerIdLoaded extends HistoryScanState {
  final BulkScanResponse historyPerIdResponse;
  const HistoryPerIdLoaded(
      this.historyPerIdResponse
      );
  @override
  List<Object?> get props => [historyPerIdResponse];
}

class HistoryPerIdNotFound extends HistoryScanState {
  @override
  List<Object?> get props => [];
}

class HistoryScanFailed extends HistoryScanState {
  @override
  List<Object?> get props => [];
}
