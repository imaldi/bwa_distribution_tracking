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

class HistoryScanLoaded extends HistoryScanState {
  final ScanUserHistoryResponse scanUserHistoryResponse;
  const HistoryScanLoaded(
      this.scanUserHistoryResponse
      );
  @override
  List<Object?> get props => [scanUserHistoryResponse];
}

class HistoryScanFailed extends HistoryScanState {
  @override
  List<Object?> get props => [];
}
