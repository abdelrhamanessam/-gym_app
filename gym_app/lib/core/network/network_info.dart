import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_info.g.dart';

class NetworkInfo {
  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }
}

@riverpod
NetworkInfo networkInfo(NetworkInfoRef ref) => NetworkInfo();
