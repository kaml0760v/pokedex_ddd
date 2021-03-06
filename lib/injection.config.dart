// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'Application/auth_bloc/auth_bloc.dart' as _i13;
import 'Application/dashboard_bloc/dashboard_bloc.dart' as _i14;
import 'Application/login_register_bloc/login_bloc.dart' as _i11;
import 'Application/registration_bloc/registration_form_bloc.dart' as _i12;
import 'Domain/core/iauth_facade.dart' as _i5;
import 'Domain/pokemon/i_pokemon_Repository.dart' as _i7;
import 'Domain/registration/i_user_repository.dart' as _i9;
import 'Infrastructure/auth/firebase_auth_facade.dart' as _i6;
import 'Infrastructure/core/firebase_injectable_module.dart' as _i15;
import 'Infrastructure/firebase/firebase_queries.dart' as _i10;
import 'Infrastructure/pokemon/pokemon_repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFirestore);
  gh.lazySingleton<_i5.IAuthFacade>(() => _i6.FirebaseAuthFacade(
      get<_i3.FirebaseAuth>(), get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i7.IPokemonRepository>(() => _i8.PokemonRepository());
  gh.lazySingleton<_i9.IUserRepository>(
      () => _i10.FirebaseQueries(get<_i4.FirebaseFirestore>()));
  gh.factory<_i11.LoginBloc>(() => _i11.LoginBloc(get<_i5.IAuthFacade>()));
  gh.factory<_i12.RegistrationFormBloc>(
      () => _i12.RegistrationFormBloc(get<_i5.IAuthFacade>()));
  gh.factory<_i13.AuthBloc>(() => _i13.AuthBloc(get<_i5.IAuthFacade>()));
  gh.factory<_i14.DashboardBloc>(() => _i14.DashboardBloc(
      get<_i9.IUserRepository>(), get<_i7.IPokemonRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends _i15.FirebaseInjectableModule {}
