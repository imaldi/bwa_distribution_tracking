part of 'surat_jalan_cubit.dart';

class SuratJalanState extends Equatable {
  bool isLoading;
  bool isFailed;
  bool isFetchingList;
  bool willScanDus;
  SuratJalanResponse? suratJalanResponse;

  SuratJalanState(
      {this.isLoading = false,
      this.isFailed = false,
      this.isFetchingList = false,
      this.willScanDus = false,
      this.suratJalanResponse});

  @override
  List<Object?> get props =>
      [isLoading, isFailed, suratJalanResponse, isFetchingList, willScanDus];

  SuratJalanState copyWith({
    bool? isLoading,
    bool? isFailed,
    SuratJalanResponse? suratJalanResponse,
    bool? isFetchingList,
    bool? willScanDus,
  }) {
    return SuratJalanState(
        isLoading: isLoading ?? this.isLoading,
        isFailed: isFailed ?? this.isFailed,
        willScanDus: willScanDus ?? this.willScanDus,
        suratJalanResponse: suratJalanResponse ?? this.suratJalanResponse,
        isFetchingList: isFetchingList ?? this.isFetchingList);
  }
}
