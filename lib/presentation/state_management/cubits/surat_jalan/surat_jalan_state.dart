part of 'surat_jalan_cubit.dart';

class SuratJalanState extends Equatable {
  bool isLoading;
  bool isFailed;
  bool isFetchingList;
  SuratJalanResponse? suratJalanResponse;

  SuratJalanState(
      {this.isLoading = false,
      this.isFailed = false,
      this.isFetchingList = false,
      this.suratJalanResponse});

  @override
  List<Object?> get props =>
      [isLoading, isFailed, suratJalanResponse, isFetchingList];

  SuratJalanState copyWith({
    bool? isLoading,
    bool? isFailed,
    SuratJalanResponse? suratJalanResponse,
    bool? isFetchingList,
  }) {
    return SuratJalanState(
        isLoading: isLoading ?? this.isLoading,
        isFailed: isFailed ?? this.isFailed,
        suratJalanResponse: suratJalanResponse ?? this.suratJalanResponse,
        isFetchingList: isFetchingList ?? this.isFetchingList);
  }
}
