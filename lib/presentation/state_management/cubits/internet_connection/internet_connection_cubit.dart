import 'package:bloc/bloc.dart';
import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:equatable/equatable.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  final NetworkInfo _networkInfo;

  InternetConnectionCubit(this._networkInfo) : super(InternetConnectionState(true));

  checkConnection() async {
    var connection = await _networkInfo.isConnected;
    emit(InternetConnectionState(connection));
    print("state.isOnline ${state.isOnline}");
  }
}
