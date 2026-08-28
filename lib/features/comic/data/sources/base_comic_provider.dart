import 'package:dio/dio.dart';
import 'package:mekuru/core/error/failures.dart';
import 'package:mekuru/core/error/result.dart';
import 'package:mekuru/features/comic/data/sources/i_comic_provider.dart';

import 'dart:typed_data';

abstract class BaseComicProvider implements IComicProvider {
  Dio get imageDio;
  
  @override
  List<String> get aliases => [];

  @override
  Future<Uint8List> fetchImageBytes(String url) async {
    final response = await imageDio.get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(response.data!);
  }

  Future<Result<T, Failure>> handleApiCall<T>(Future<T> Function() apiCall) async {
    try {
      final result = await apiCall();
      return Success(result);
    } on DioException catch (e) {
      if (e.response != null) {
        return Error(ServerFailure('伺服器錯誤 (HTTP ${e.response?.statusCode})'));
      }
      return const Error(NetworkFailure());
    } on ServerException catch (e) {
      return Error(ServerFailure(e.message));
    } on AuthException catch (e) {
      return Error(AuthFailure(e.message));
    } catch (e) {
      return Error(UnknownFailure(e.toString()));
    }
  }
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}
