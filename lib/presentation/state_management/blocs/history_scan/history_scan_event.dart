part of 'history_scan_bloc.dart';

@immutable
abstract class HistoryScanEvent extends Equatable {}

class TestKeptHistoryStateEvent extends HistoryScanEvent {
  @override
  List<Object?> get props => [];
}

class GetUserScanHistoryEvent extends HistoryScanEvent {
  @override
  List<Object?> get props => [];
}

class GetAllScanHistoryEvent extends HistoryScanEvent {
  @override
  List<Object?> get props => [];
}
