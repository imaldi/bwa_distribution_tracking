part of 'surat_jalan_cubit.dart';

class SuratJalanState extends Equatable {
  bool isLoading;
  bool isFailed;
  bool isFetchingList;
  bool willScanDus;
  bool isPerId;
  String? menuStatusForTitle;
  SuratJalanResponse? suratJalanResponse;
  BulkScanResponse? searchResult;

  SuratJalanState(
      {this.isLoading = false,
      this.isFailed = false,
      this.isFetchingList = false,
      this.willScanDus = false,
      this.isPerId = false,
      this.menuStatusForTitle,
      this.searchResult,
      this.suratJalanResponse});

  @override
  List<Object?> get props => [
        isLoading,
        isFailed,
        suratJalanResponse,
        isPerId,
        menuStatusForTitle,
        isFetchingList,
        searchResult,
        willScanDus
      ];

  SuratJalanState copyWith({
    bool? isLoading,
    bool? isFailed,
    SuratJalanResponse? suratJalanResponse,
    bool? isFetchingList,
    String? menuStatusForTitle,
    BulkScanResponse? searchResult,
    bool? willScanDus,
    bool? isPerId,
  }) {
    return SuratJalanState(
        isLoading: isLoading ?? this.isLoading,
        isFailed: isFailed ?? this.isFailed,
        isPerId: isPerId ?? this.isPerId,
        menuStatusForTitle: menuStatusForTitle ?? this.menuStatusForTitle,
        searchResult: searchResult ?? this.searchResult,
        willScanDus: willScanDus ?? this.willScanDus,
        suratJalanResponse: suratJalanResponse ?? this.suratJalanResponse,
        isFetchingList: isFetchingList ?? this.isFetchingList);
  }
}
