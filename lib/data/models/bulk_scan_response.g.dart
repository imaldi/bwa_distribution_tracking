// GENERATED CODE - DO NOT MODIFY BY HAND

part of bulk_scan_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BulkScanResponse> _$bulkScanResponseSerializer =
    new _$BulkScanResponseSerializer();
Serializer<BulkQRScanModel> _$bulkQRScanModelSerializer =
    new _$BulkQRScanModelSerializer();
Serializer<BoxQRScanModel> _$boxQRScanModelSerializer =
    new _$BoxQRScanModelSerializer();

class _$BulkScanResponseSerializer
    implements StructuredSerializer<BulkScanResponse> {
  @override
  final Iterable<Type> types = const [BulkScanResponse, _$BulkScanResponse];
  @override
  final String wireName = 'BulkScanResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, BulkScanResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.success;
    if (value != null) {
      result
        ..add('success')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(BulkQRScanModel)])));
    }
    value = object.detail;
    if (value != null) {
      result
        ..add('detail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(BoxQRScanModel)])));
    }
    return result;
  }

  @override
  BulkScanResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BulkScanResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(BulkQRScanModel)]))!
              as BuiltList<Object?>);
          break;
        case 'detail':
          result.detail.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(BoxQRScanModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$BulkQRScanModelSerializer
    implements StructuredSerializer<BulkQRScanModel> {
  @override
  final Iterable<Type> types = const [BulkQRScanModel, _$BulkQRScanModel];
  @override
  final String wireName = 'BulkQRScanModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, BulkQRScanModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nosj;
    if (value != null) {
      result
        ..add('nosj')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.qrcodeSj;
    if (value != null) {
      result
        ..add('qrcode_sj')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nopc;
    if (value != null) {
      result
        ..add('nopc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.kodeBatch;
    if (value != null) {
      result
        ..add('kode_batch')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.alamat;
    if (value != null) {
      result
        ..add('alamat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pic;
    if (value != null) {
      result
        ..add('pic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.picTelp;
    if (value != null) {
      result
        ..add('pic_telp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tanggal;
    if (value != null) {
      result
        ..add('tanggal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dikirimBy;
    if (value != null) {
      result
        ..add('dikirim_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nopol;
    if (value != null) {
      result
        ..add('nopol')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nmPengemudi;
    if (value != null) {
      result
        ..add('nm_pengemudi')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notelp;
    if (value != null) {
      result
        ..add('notelp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.approval;
    if (value != null) {
      result
        ..add('approval')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.kg;
    if (value != null) {
      result
        ..add('kg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ttdGa;
    if (value != null) {
      result
        ..add('ttd_ga')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ttdWl;
    if (value != null) {
      result
        ..add('ttd_wl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updatedBy;
    if (value != null) {
      result
        ..add('updated_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  BulkQRScanModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BulkQRScanModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'nosj':
          result.nosj = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'qrcode_sj':
          result.qrcodeSj = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nopc':
          result.nopc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'kode_batch':
          result.kodeBatch = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'alamat':
          result.alamat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pic':
          result.pic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pic_telp':
          result.picTelp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tanggal':
          result.tanggal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dikirim_by':
          result.dikirimBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nopol':
          result.nopol = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nm_pengemudi':
          result.nmPengemudi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'notelp':
          result.notelp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'approval':
          result.approval = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'kg':
          result.kg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ttd_ga':
          result.ttdGa = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ttd_wl':
          result.ttdWl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_by':
          result.updatedBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$BoxQRScanModelSerializer
    implements StructuredSerializer<BoxQRScanModel> {
  @override
  final Iterable<Type> types = const [BoxQRScanModel, _$BoxQRScanModel];
  @override
  final String wireName = 'BoxQRScanModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, BoxQRScanModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.notrans;
    if (value != null) {
      result
        ..add('notrans')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nosj;
    if (value != null) {
      result
        ..add('nosj')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.kodeBatch;
    if (value != null) {
      result
        ..add('kode_batch')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nmProject;
    if (value != null) {
      result
        ..add('nm_project')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jenisQuran;
    if (value != null) {
      result
        ..add('jenis_quran')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jmlKeluar;
    if (value != null) {
      result
        ..add('jml_keluar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vendor;
    if (value != null) {
      result
        ..add('vendor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.warehouse;
    if (value != null) {
      result
        ..add('warehouse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jenisReject;
    if (value != null) {
      result
        ..add('jenis_reject')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.keterangan;
    if (value != null) {
      result
        ..add('keterangan')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.approval;
    if (value != null) {
      result
        ..add('approval')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nopc;
    if (value != null) {
      result
        ..add('nopc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.upload;
    if (value != null) {
      result
        ..add('upload')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tglDiajukan;
    if (value != null) {
      result
        ..add('tgl_diajukan')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updatedBy;
    if (value != null) {
      result
        ..add('updated_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  BoxQRScanModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BoxQRScanModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'notrans':
          result.notrans = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nosj':
          result.nosj = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'kode_batch':
          result.kodeBatch = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nm_project':
          result.nmProject = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'jenis_quran':
          result.jenisQuran = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'jml_keluar':
          result.jmlKeluar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vendor':
          result.vendor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'warehouse':
          result.warehouse = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'jenis_reject':
          result.jenisReject = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'keterangan':
          result.keterangan = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'approval':
          result.approval = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nopc':
          result.nopc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'upload':
          result.upload = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tgl_diajukan':
          result.tglDiajukan = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_by':
          result.updatedBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$BulkScanResponse extends BulkScanResponse {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final BuiltList<BulkQRScanModel>? data;
  @override
  final BuiltList<BoxQRScanModel>? detail;

  factory _$BulkScanResponse(
          [void Function(BulkScanResponseBuilder)? updates]) =>
      (new BulkScanResponseBuilder()..update(updates))._build();

  _$BulkScanResponse._({this.success, this.message, this.data, this.detail})
      : super._();

  @override
  BulkScanResponse rebuild(void Function(BulkScanResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BulkScanResponseBuilder toBuilder() =>
      new BulkScanResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BulkScanResponse &&
        success == other.success &&
        message == other.message &&
        data == other.data &&
        detail == other.detail;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, success.hashCode), message.hashCode), data.hashCode),
        detail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BulkScanResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('data', data)
          ..add('detail', detail))
        .toString();
  }
}

class BulkScanResponseBuilder
    implements Builder<BulkScanResponse, BulkScanResponseBuilder> {
  _$BulkScanResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<BulkQRScanModel>? _data;
  ListBuilder<BulkQRScanModel> get data =>
      _$this._data ??= new ListBuilder<BulkQRScanModel>();
  set data(ListBuilder<BulkQRScanModel>? data) => _$this._data = data;

  ListBuilder<BoxQRScanModel>? _detail;
  ListBuilder<BoxQRScanModel> get detail =>
      _$this._detail ??= new ListBuilder<BoxQRScanModel>();
  set detail(ListBuilder<BoxQRScanModel>? detail) => _$this._detail = detail;

  BulkScanResponseBuilder();

  BulkScanResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _data = $v.data?.toBuilder();
      _detail = $v.detail?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BulkScanResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BulkScanResponse;
  }

  @override
  void update(void Function(BulkScanResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BulkScanResponse build() => _build();

  _$BulkScanResponse _build() {
    _$BulkScanResponse _$result;
    try {
      _$result = _$v ??
          new _$BulkScanResponse._(
              success: success,
              message: message,
              data: _data?.build(),
              detail: _detail?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'detail';
        _detail?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BulkScanResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$BulkQRScanModel extends BulkQRScanModel {
  @override
  final int? id;
  @override
  final String? nosj;
  @override
  final String? qrcodeSj;
  @override
  final String? nopc;
  @override
  final String? kodeBatch;
  @override
  final String? alamat;
  @override
  final String? pic;
  @override
  final String? picTelp;
  @override
  final String? tanggal;
  @override
  final String? dikirimBy;
  @override
  final String? nopol;
  @override
  final String? nmPengemudi;
  @override
  final String? notelp;
  @override
  final String? approval;
  @override
  final String? total;
  @override
  final String? kg;
  @override
  final String? ttdGa;
  @override
  final String? ttdWl;
  @override
  final String? createdBy;
  @override
  final String? updatedBy;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$BulkQRScanModel([void Function(BulkQRScanModelBuilder)? updates]) =>
      (new BulkQRScanModelBuilder()..update(updates))._build();

  _$BulkQRScanModel._(
      {this.id,
      this.nosj,
      this.qrcodeSj,
      this.nopc,
      this.kodeBatch,
      this.alamat,
      this.pic,
      this.picTelp,
      this.tanggal,
      this.dikirimBy,
      this.nopol,
      this.nmPengemudi,
      this.notelp,
      this.approval,
      this.total,
      this.kg,
      this.ttdGa,
      this.ttdWl,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  BulkQRScanModel rebuild(void Function(BulkQRScanModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BulkQRScanModelBuilder toBuilder() =>
      new BulkQRScanModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BulkQRScanModel &&
        id == other.id &&
        nosj == other.nosj &&
        qrcodeSj == other.qrcodeSj &&
        nopc == other.nopc &&
        kodeBatch == other.kodeBatch &&
        alamat == other.alamat &&
        pic == other.pic &&
        picTelp == other.picTelp &&
        tanggal == other.tanggal &&
        dikirimBy == other.dikirimBy &&
        nopol == other.nopol &&
        nmPengemudi == other.nmPengemudi &&
        notelp == other.notelp &&
        approval == other.approval &&
        total == other.total &&
        kg == other.kg &&
        ttdGa == other.ttdGa &&
        ttdWl == other.ttdWl &&
        createdBy == other.createdBy &&
        updatedBy == other.updatedBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc(0, id.hashCode), nosj.hashCode), qrcodeSj.hashCode),
                                                                                nopc.hashCode),
                                                                            kodeBatch.hashCode),
                                                                        alamat.hashCode),
                                                                    pic.hashCode),
                                                                picTelp.hashCode),
                                                            tanggal.hashCode),
                                                        dikirimBy.hashCode),
                                                    nopol.hashCode),
                                                nmPengemudi.hashCode),
                                            notelp.hashCode),
                                        approval.hashCode),
                                    total.hashCode),
                                kg.hashCode),
                            ttdGa.hashCode),
                        ttdWl.hashCode),
                    createdBy.hashCode),
                updatedBy.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BulkQRScanModel')
          ..add('id', id)
          ..add('nosj', nosj)
          ..add('qrcodeSj', qrcodeSj)
          ..add('nopc', nopc)
          ..add('kodeBatch', kodeBatch)
          ..add('alamat', alamat)
          ..add('pic', pic)
          ..add('picTelp', picTelp)
          ..add('tanggal', tanggal)
          ..add('dikirimBy', dikirimBy)
          ..add('nopol', nopol)
          ..add('nmPengemudi', nmPengemudi)
          ..add('notelp', notelp)
          ..add('approval', approval)
          ..add('total', total)
          ..add('kg', kg)
          ..add('ttdGa', ttdGa)
          ..add('ttdWl', ttdWl)
          ..add('createdBy', createdBy)
          ..add('updatedBy', updatedBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class BulkQRScanModelBuilder
    implements Builder<BulkQRScanModel, BulkQRScanModelBuilder> {
  _$BulkQRScanModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _nosj;
  String? get nosj => _$this._nosj;
  set nosj(String? nosj) => _$this._nosj = nosj;

  String? _qrcodeSj;
  String? get qrcodeSj => _$this._qrcodeSj;
  set qrcodeSj(String? qrcodeSj) => _$this._qrcodeSj = qrcodeSj;

  String? _nopc;
  String? get nopc => _$this._nopc;
  set nopc(String? nopc) => _$this._nopc = nopc;

  String? _kodeBatch;
  String? get kodeBatch => _$this._kodeBatch;
  set kodeBatch(String? kodeBatch) => _$this._kodeBatch = kodeBatch;

  String? _alamat;
  String? get alamat => _$this._alamat;
  set alamat(String? alamat) => _$this._alamat = alamat;

  String? _pic;
  String? get pic => _$this._pic;
  set pic(String? pic) => _$this._pic = pic;

  String? _picTelp;
  String? get picTelp => _$this._picTelp;
  set picTelp(String? picTelp) => _$this._picTelp = picTelp;

  String? _tanggal;
  String? get tanggal => _$this._tanggal;
  set tanggal(String? tanggal) => _$this._tanggal = tanggal;

  String? _dikirimBy;
  String? get dikirimBy => _$this._dikirimBy;
  set dikirimBy(String? dikirimBy) => _$this._dikirimBy = dikirimBy;

  String? _nopol;
  String? get nopol => _$this._nopol;
  set nopol(String? nopol) => _$this._nopol = nopol;

  String? _nmPengemudi;
  String? get nmPengemudi => _$this._nmPengemudi;
  set nmPengemudi(String? nmPengemudi) => _$this._nmPengemudi = nmPengemudi;

  String? _notelp;
  String? get notelp => _$this._notelp;
  set notelp(String? notelp) => _$this._notelp = notelp;

  String? _approval;
  String? get approval => _$this._approval;
  set approval(String? approval) => _$this._approval = approval;

  String? _total;
  String? get total => _$this._total;
  set total(String? total) => _$this._total = total;

  String? _kg;
  String? get kg => _$this._kg;
  set kg(String? kg) => _$this._kg = kg;

  String? _ttdGa;
  String? get ttdGa => _$this._ttdGa;
  set ttdGa(String? ttdGa) => _$this._ttdGa = ttdGa;

  String? _ttdWl;
  String? get ttdWl => _$this._ttdWl;
  set ttdWl(String? ttdWl) => _$this._ttdWl = ttdWl;

  String? _createdBy;
  String? get createdBy => _$this._createdBy;
  set createdBy(String? createdBy) => _$this._createdBy = createdBy;

  String? _updatedBy;
  String? get updatedBy => _$this._updatedBy;
  set updatedBy(String? updatedBy) => _$this._updatedBy = updatedBy;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  BulkQRScanModelBuilder();

  BulkQRScanModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nosj = $v.nosj;
      _qrcodeSj = $v.qrcodeSj;
      _nopc = $v.nopc;
      _kodeBatch = $v.kodeBatch;
      _alamat = $v.alamat;
      _pic = $v.pic;
      _picTelp = $v.picTelp;
      _tanggal = $v.tanggal;
      _dikirimBy = $v.dikirimBy;
      _nopol = $v.nopol;
      _nmPengemudi = $v.nmPengemudi;
      _notelp = $v.notelp;
      _approval = $v.approval;
      _total = $v.total;
      _kg = $v.kg;
      _ttdGa = $v.ttdGa;
      _ttdWl = $v.ttdWl;
      _createdBy = $v.createdBy;
      _updatedBy = $v.updatedBy;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BulkQRScanModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BulkQRScanModel;
  }

  @override
  void update(void Function(BulkQRScanModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BulkQRScanModel build() => _build();

  _$BulkQRScanModel _build() {
    final _$result = _$v ??
        new _$BulkQRScanModel._(
            id: id,
            nosj: nosj,
            qrcodeSj: qrcodeSj,
            nopc: nopc,
            kodeBatch: kodeBatch,
            alamat: alamat,
            pic: pic,
            picTelp: picTelp,
            tanggal: tanggal,
            dikirimBy: dikirimBy,
            nopol: nopol,
            nmPengemudi: nmPengemudi,
            notelp: notelp,
            approval: approval,
            total: total,
            kg: kg,
            ttdGa: ttdGa,
            ttdWl: ttdWl,
            createdBy: createdBy,
            updatedBy: updatedBy,
            createdAt: createdAt,
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

class _$BoxQRScanModel extends BoxQRScanModel {
  @override
  final int? id;
  @override
  final String? notrans;
  @override
  final String? nosj;
  @override
  final String? kodeBatch;
  @override
  final String? nmProject;
  @override
  final String? jenisQuran;
  @override
  final String? jmlKeluar;
  @override
  final String? vendor;
  @override
  final String? warehouse;
  @override
  final String? status;
  @override
  final String? jenisReject;
  @override
  final String? keterangan;
  @override
  final String? approval;
  @override
  final String? nopc;
  @override
  final String? upload;
  @override
  final String? tglDiajukan;
  @override
  final String? createdBy;
  @override
  final String? updatedBy;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$BoxQRScanModel([void Function(BoxQRScanModelBuilder)? updates]) =>
      (new BoxQRScanModelBuilder()..update(updates))._build();

  _$BoxQRScanModel._(
      {this.id,
      this.notrans,
      this.nosj,
      this.kodeBatch,
      this.nmProject,
      this.jenisQuran,
      this.jmlKeluar,
      this.vendor,
      this.warehouse,
      this.status,
      this.jenisReject,
      this.keterangan,
      this.approval,
      this.nopc,
      this.upload,
      this.tglDiajukan,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  BoxQRScanModel rebuild(void Function(BoxQRScanModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BoxQRScanModelBuilder toBuilder() =>
      new BoxQRScanModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BoxQRScanModel &&
        id == other.id &&
        notrans == other.notrans &&
        nosj == other.nosj &&
        kodeBatch == other.kodeBatch &&
        nmProject == other.nmProject &&
        jenisQuran == other.jenisQuran &&
        jmlKeluar == other.jmlKeluar &&
        vendor == other.vendor &&
        warehouse == other.warehouse &&
        status == other.status &&
        jenisReject == other.jenisReject &&
        keterangan == other.keterangan &&
        approval == other.approval &&
        nopc == other.nopc &&
        upload == other.upload &&
        tglDiajukan == other.tglDiajukan &&
        createdBy == other.createdBy &&
        updatedBy == other.updatedBy &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc(0, id.hashCode),
                                                                                notrans.hashCode),
                                                                            nosj.hashCode),
                                                                        kodeBatch.hashCode),
                                                                    nmProject.hashCode),
                                                                jenisQuran.hashCode),
                                                            jmlKeluar.hashCode),
                                                        vendor.hashCode),
                                                    warehouse.hashCode),
                                                status.hashCode),
                                            jenisReject.hashCode),
                                        keterangan.hashCode),
                                    approval.hashCode),
                                nopc.hashCode),
                            upload.hashCode),
                        tglDiajukan.hashCode),
                    createdBy.hashCode),
                updatedBy.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BoxQRScanModel')
          ..add('id', id)
          ..add('notrans', notrans)
          ..add('nosj', nosj)
          ..add('kodeBatch', kodeBatch)
          ..add('nmProject', nmProject)
          ..add('jenisQuran', jenisQuran)
          ..add('jmlKeluar', jmlKeluar)
          ..add('vendor', vendor)
          ..add('warehouse', warehouse)
          ..add('status', status)
          ..add('jenisReject', jenisReject)
          ..add('keterangan', keterangan)
          ..add('approval', approval)
          ..add('nopc', nopc)
          ..add('upload', upload)
          ..add('tglDiajukan', tglDiajukan)
          ..add('createdBy', createdBy)
          ..add('updatedBy', updatedBy)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class BoxQRScanModelBuilder
    implements Builder<BoxQRScanModel, BoxQRScanModelBuilder> {
  _$BoxQRScanModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _notrans;
  String? get notrans => _$this._notrans;
  set notrans(String? notrans) => _$this._notrans = notrans;

  String? _nosj;
  String? get nosj => _$this._nosj;
  set nosj(String? nosj) => _$this._nosj = nosj;

  String? _kodeBatch;
  String? get kodeBatch => _$this._kodeBatch;
  set kodeBatch(String? kodeBatch) => _$this._kodeBatch = kodeBatch;

  String? _nmProject;
  String? get nmProject => _$this._nmProject;
  set nmProject(String? nmProject) => _$this._nmProject = nmProject;

  String? _jenisQuran;
  String? get jenisQuran => _$this._jenisQuran;
  set jenisQuran(String? jenisQuran) => _$this._jenisQuran = jenisQuran;

  String? _jmlKeluar;
  String? get jmlKeluar => _$this._jmlKeluar;
  set jmlKeluar(String? jmlKeluar) => _$this._jmlKeluar = jmlKeluar;

  String? _vendor;
  String? get vendor => _$this._vendor;
  set vendor(String? vendor) => _$this._vendor = vendor;

  String? _warehouse;
  String? get warehouse => _$this._warehouse;
  set warehouse(String? warehouse) => _$this._warehouse = warehouse;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _jenisReject;
  String? get jenisReject => _$this._jenisReject;
  set jenisReject(String? jenisReject) => _$this._jenisReject = jenisReject;

  String? _keterangan;
  String? get keterangan => _$this._keterangan;
  set keterangan(String? keterangan) => _$this._keterangan = keterangan;

  String? _approval;
  String? get approval => _$this._approval;
  set approval(String? approval) => _$this._approval = approval;

  String? _nopc;
  String? get nopc => _$this._nopc;
  set nopc(String? nopc) => _$this._nopc = nopc;

  String? _upload;
  String? get upload => _$this._upload;
  set upload(String? upload) => _$this._upload = upload;

  String? _tglDiajukan;
  String? get tglDiajukan => _$this._tglDiajukan;
  set tglDiajukan(String? tglDiajukan) => _$this._tglDiajukan = tglDiajukan;

  String? _createdBy;
  String? get createdBy => _$this._createdBy;
  set createdBy(String? createdBy) => _$this._createdBy = createdBy;

  String? _updatedBy;
  String? get updatedBy => _$this._updatedBy;
  set updatedBy(String? updatedBy) => _$this._updatedBy = updatedBy;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  BoxQRScanModelBuilder();

  BoxQRScanModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _notrans = $v.notrans;
      _nosj = $v.nosj;
      _kodeBatch = $v.kodeBatch;
      _nmProject = $v.nmProject;
      _jenisQuran = $v.jenisQuran;
      _jmlKeluar = $v.jmlKeluar;
      _vendor = $v.vendor;
      _warehouse = $v.warehouse;
      _status = $v.status;
      _jenisReject = $v.jenisReject;
      _keterangan = $v.keterangan;
      _approval = $v.approval;
      _nopc = $v.nopc;
      _upload = $v.upload;
      _tglDiajukan = $v.tglDiajukan;
      _createdBy = $v.createdBy;
      _updatedBy = $v.updatedBy;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BoxQRScanModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BoxQRScanModel;
  }

  @override
  void update(void Function(BoxQRScanModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BoxQRScanModel build() => _build();

  _$BoxQRScanModel _build() {
    final _$result = _$v ??
        new _$BoxQRScanModel._(
            id: id,
            notrans: notrans,
            nosj: nosj,
            kodeBatch: kodeBatch,
            nmProject: nmProject,
            jenisQuran: jenisQuran,
            jmlKeluar: jmlKeluar,
            vendor: vendor,
            warehouse: warehouse,
            status: status,
            jenisReject: jenisReject,
            keterangan: keterangan,
            approval: approval,
            nopc: nopc,
            upload: upload,
            tglDiajukan: tglDiajukan,
            createdBy: createdBy,
            updatedBy: updatedBy,
            createdAt: createdAt,
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
