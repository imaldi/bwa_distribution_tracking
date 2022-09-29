import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

@GenerateMocks([DataConnectionChecker])
import 'network_info_test.mocks.dart';
// class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test('should forward the call to DataConnectionChecker.hasConnection',
        () async {
      /// arrange
      final tHasConnectionFuture = Future.value(true);

      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((realInvocation) => tHasConnectionFuture);

      /// act
      final result = networkInfo.isConnected;

      /// assert
      verify(mockDataConnectionChecker.hasConnection);

      /// Utilizing Dart's default referential equality.
      /// Only references to the same object are equal.
      expect(result, tHasConnectionFuture);
    });
  });
}
