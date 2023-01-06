part of 'detail_riwayat_cubit.dart';

class DetailRiwayatState extends Equatable {
  final DusDetailResponse? dusDetailResponse;
  const DetailRiwayatState(this.dusDetailResponse);

  DetailRiwayatState copyWith({DusDetailResponse? dusDetailResponse}){
    return DetailRiwayatState(dusDetailResponse ?? this.dusDetailResponse);
  }
  @override
  List<Object?> get props => [dusDetailResponse];
}
