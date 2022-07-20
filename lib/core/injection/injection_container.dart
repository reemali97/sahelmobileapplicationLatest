import 'package:get_it/get_it.dart';
import 'package:sahelmobileapplication/core/core.export.dart';
import 'package:sahelmobileapplication/features/authentication/authentication.export.dart';

final GetIt sl = GetIt.instance;

class DependencyInjectionInit{

  Future<void> init()async{
    ///init Network InterFace
    final networkInterface = NetworkInterfaceImpl(enableLog: true);
    sl.registerLazySingleton(() => networkInterface);
    ///Bloc
    sl.registerFactory(() => LoginBloc(authenticationUseCases: sl()));
    ///init Use Cases
    final authUseCase = authenticationUseCases(networkInterface);
    ///Register Use Case
    sl.registerLazySingleton(() => authUseCase);
  }

  AuthenticationUseCases authenticationUseCases(NetworkInterface networkInterface){
    final AuthenticationRemoteData _authenticationRemoteDataImpl;
    final AuthenticationRepositories _authenticationRepositoriesImpl;
    _authenticationRemoteDataImpl = AuthenticationRemoteDataImpl(networkImpl:networkInterface );
    _authenticationRepositoriesImpl = AuthenticationRepositoriesImpl(authenticationRemoteData:_authenticationRemoteDataImpl);
    return AuthenticationUseCases(authenticationRepositories:_authenticationRepositoriesImpl );
  }


}

