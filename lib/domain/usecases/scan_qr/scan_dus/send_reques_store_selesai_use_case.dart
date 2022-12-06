import 'package:bwa_distribution_tracking/core/error/failures.dart';
import 'package:bwa_distribution_tracking/core/params/store_selesai_param.dart';
import 'package:bwa_distribution_tracking/core/usecase/usecase.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/dus_list_response/store_selesai_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/params/no_params.dart';
import '../../../repositories/single_scan_repository.dart';

class SendRequesStoreSelesaiUseCase extends UseCase<StoreSelesaiResponse,StoreSelesaiParam>{
  final SingleScanRepository _singleScanRepository;
  SendRequesStoreSelesaiUseCase(this._singleScanRepository);
  @override
  Future<Either<Failure, StoreSelesaiResponse>> call(StoreSelesaiParam params) {
    return _singleScanRepository.sendRequestStoreSelesai(params.storeSelesaiResponse);
  }

}