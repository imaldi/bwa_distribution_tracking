part of 'internet_connection_cubit.dart';

class InternetConnectionState extends Equatable {
  final bool isOnline;
  const InternetConnectionState(this.isOnline);

  @override
  List<Object?> get props => [isOnline];
}
