
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kooha_task/src/core/domain/repositories/user_repository.dart';
import 'package:kooha_task/src/core/services/local_database/abstract_hive.dart';
import 'package:kooha_task/src/core/services/local_database/hive_keys.dart';


class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._storage, this._ref);

  final AbstractHive _storage;
  final Ref _ref;


  @override
  void saveToken(String val) async {
    await _storage.put(HiveKeys.token, val);
  }

  @override
  String getToken() {
    return _storage.get(HiveKeys.token) ?? "";
  }
}


