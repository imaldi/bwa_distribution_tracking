import 'package:bwa_distribution_tracking/core/params/login_params.dart';
import 'package:bwa_distribution_tracking/data/models/login_response.dart';
import 'package:bwa_distribution_tracking/data/models/user_model.dart';
import 'package:bwa_distribution_tracking/domain/repositories/login_repository.dart';
import 'package:bwa_distribution_tracking/domain/usecases/user_login.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_login_test.mocks.dart';

@GenerateMocks([MockAuthRepository])
class MockAuthRepository extends Mock
    implements AuthRepository {
}

void main(){
  late UserLogin usecase;
  late MockMockAuthRepository mockAuthRepository;

  setUp((){
    mockAuthRepository = MockMockAuthRepository();
    usecase = UserLogin(mockAuthRepository);
  });

  const tPhone = "082322323223";
  const tPassword = "Majid123";
  final tLoginResponse = LoginResponse(
          (b) => b
              ..responseCode = 200
              ..success = true
              ..token = Token((t) => t..token = "asdasdasdasda").toBuilder()
              ..user = UserModel((usr) => usr..id = 1 ..name = "Aldi").toBuilder()
  );

  test(
    'should get login response from the repository',
        () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      /// Ketika loginRepo.login() dipanggil dengan username dan password apapaun,
      when(mockAuthRepository.login(any, any))
      /// maka jawab dengan instance Right(tLoginResponse)
          .thenAnswer((_) async => Right(tLoginResponse));

      // The "act" phase of the test. Call the not-yet-existent method.
      /// ambil result dari pemanggilan usecase.execute.
      /// Kenapa usecase tidak di mock? karena satu2nya tugas usecase adalah
      /// memanggil function repository (end point) yang dibutuhkan,
      /// dan pemanggilan function repository itu yang mau dites pemanggilannya
      final result = await usecase(const LoginParams(phone: tPhone, password: tPassword));
      // print(result);

      // UseCase should simply return whatever was returned from the Repository
      /// bandingkan result yang di dapat dari usecase, apakah mengembalikan (return) Right(tLoginResponse)
      expect(result, Right(tLoginResponse));

      // Verify that the method has been called on the Repository
      /// pastikan class repository memanggil method login nya
      verify(mockAuthRepository.login(tPhone,tPassword));

      // Only the above method should be called and nothing more.
      /// pastikan di repository tidak terpanggil method lain
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}