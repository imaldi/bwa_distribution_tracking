import 'package:bwa_distribution_tracking/core/platform/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([InternetConnectionChecker])
import 'network_info_test.mocks.dart';
// class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockInternetConnectionChecker();
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
