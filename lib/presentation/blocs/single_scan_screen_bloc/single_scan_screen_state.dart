part of 'single_scan_screen_bloc.dart';

abstract class SingleScanScreenState extends Equatable {
  const SingleScanScreenState();
}

class SingleScanScreenInitial extends SingleScanScreenState {
  @override
  List<Object> get props => [];
}
class SingleScanScreenLoading extends SingleScanScreenState {
  @override
  List<Object> get props => [];
}
class SingleScanScreenSuccess extends SingleScanScreenState {
  StoreSelesaiResponse storeSelesaiResponse;
  SingleScanScreenSuccess(this.storeSelesaiResponse);
  @override
  List<Object> get props => [storeSelesaiResponse];
}
class SingleScanScreenFailed extends SingleScanScreenState {
  final Failure failure;
  final String errorMessage;

  get debug => "The Error is: $errorMessage";

  const SingleScanScreenFailed(this.failure,{this.errorMessage = "Unspecified Error"});

  @override
  List<Object?> get props => [failure,errorMessage];
}
