part of 'single_scan_screen_bloc.dart';

abstract class SingleScanScreenEvent extends Equatable {
  const SingleScanScreenEvent();
}

class SendRequesStoreSelesai extends SingleScanScreenEvent {
  StoreSelesaiResponse storeSelesaiResponse;
  SendRequesStoreSelesai(this.storeSelesaiResponse);
  @override
  List<Object?> get props => [
    storeSelesaiResponse
  ];

}
