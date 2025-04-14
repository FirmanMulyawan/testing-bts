import '../base/base_dio_datasource.dart';
import '../ext/dio_ext.dart';

mixin ApiLogin on BaseDioDataSource {
  Future apiLogin(data) {
    String path = '/login';
    return post(path, data: data).load();
  }

  Future apiRegister(data) {
    String path = '/register';
    return post(path, data: data).load();
  }
}
