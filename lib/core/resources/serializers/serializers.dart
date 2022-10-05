import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:bwa_distribution_tracking/data/models/user_model.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.dart';
part 'serializers.g.dart';

@SerializersFor([
  UserModel,
  LoginResponse,
  Token,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
