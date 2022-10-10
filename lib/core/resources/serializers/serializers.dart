import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bwa_distribution_tracking/data/models/qr_scan/bulk_scan_response.dart';
import 'package:bwa_distribution_tracking/data/models/auth/user_model.dart';
import 'package:bwa_distribution_tracking/data/models/auth/login_response.dart';

import 'date_time_serializer.dart';
part 'serializers.g.dart';

@SerializersFor([
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
