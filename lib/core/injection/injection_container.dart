import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sahelmobileapplication/core/core.export.dart';
import 'package:sahelmobileapplication/features/features.export.dart';
import 'package:sahelmobileapplication/features/profile/data/datasorce/change_password_datasource.dart';


final GetIt sl = GetIt.instance;

class DependencyInjectionInit{

  Future<void> init()async{
    ///init Network InterFace
    final networkInterface = NetworkInterfaceImpl(enableLog: true);

    ///Localization
    final locale = Locale.fromSubtags(languageCode: CacheHelper.getData(key: 'languages') ?? 'en');

    ///Translate
    sl.registerLazySingleton(() => networkInterface);

    ///Bloc
    sl.registerFactory(() => LoginBloc(authenticationUseCases: sl()));
    sl.registerFactory(() => ChangePasswordBloc(changePassUseCases: sl()));

    ///init Use Cases
    ///Home Feature
    final authUseCase = authenticationUseCases(networkInterface);


    ///Profile Feature

    ///Register Use Case
    sl.registerLazySingleton(() => authUseCase);
    sl.registerLazySingleton(() => changePassUseCase);

  }

  AuthenticationUseCases authenticationUseCases(NetworkInterface networkInterface){
    final AuthenticationRemoteData _authenticationRemoteDataImpl;
    final AuthenticationRepositories _authenticationRepositoriesImpl;
    _authenticationRemoteDataImpl = AuthenticationRemoteDataImpl(networkImpl:networkInterface );
    _authenticationRepositoriesImpl = AuthenticationRepositoriesImpl(authenticationRemoteData:_authenticationRemoteDataImpl);
    return AuthenticationUseCases(authenticationRepositories:_authenticationRepositoriesImpl );
  }

  ChangePassUseCases changePassUseCases(NetworkInterface networkInterface){
    final ChangePasswordRemoteData _changePasswordRemoteDataImpl;
    final ChangePasswordRepositories _changePasswordRepositoriesImpl;
    _changePasswordRemoteDataImpl = ChangePasswordRemoteDataImpl(networkImpl: networkInterface);
    _changePasswordRepositoriesImpl = ChangePasswordRepositoriesImpl(changePasswordRemoteData:_changePasswordRemoteDataImpl );
    return ChangePassUseCases(changePasswordRepositories:_changePasswordRepositoriesImpl);
  }

  EditProfileDataUseCases editProfileUseCases(NetworkInterface networkInterface){
    final EditProfileRemoteData _editProfileRemoteDataImpl;
    final EditProfileDataRepositories _editProfileDataRepositoriesImpl;
    _editProfileRemoteDataImpl = EditProfileRemoteDataImpl(networkImpl: networkInterface);
    _editProfileDataRepositoriesImpl = EditProfileDataRepositoriesImpl(editProfileRemoteData: _editProfileRemoteDataImpl );
    return EditProfileDataUseCases(editProfileDataRepositories: _editProfileDataRepositoriesImpl);
  }




}

