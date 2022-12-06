import 'package:equatable/equatable.dart';

import '../../data/models/qr_scan/dus_list_response/store_selesai_response.dart';

class StoreSelesaiParam extends Equatable{
  final StoreSelesaiResponse storeSelesaiResponse;
  const StoreSelesaiParam(this.storeSelesaiResponse);
  @override
  List<Object?> get props =>[storeSelesaiResponse];

}