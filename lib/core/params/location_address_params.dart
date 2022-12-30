import 'package:equatable/equatable.dart';

class LocationAddressParams extends Equatable {
  final double latitude;
  final double longitude;
  const LocationAddressParams({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [
    latitude,
    longitude
  ];

}