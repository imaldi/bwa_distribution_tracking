part of 'detail_riwayat_cubit.dart';

class DetailRiwayatState extends Equatable {
  final DusDetailResponse? dusDetailResponse;
  final String? address;

  const DetailRiwayatState(this.dusDetailResponse, {this.address});

  DetailRiwayatState copyWith({DusDetailResponse? dusDetailResponse, String? address}){
    return DetailRiwayatState(dusDetailResponse ?? this.dusDetailResponse, address: address ?? this.address);
  }
  @override
  List<Object?> get props => [dusDetailResponse,address];
}
