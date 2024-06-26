import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  /// checks internet connectivity. TRUE if internet is connected else FALSE.
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
