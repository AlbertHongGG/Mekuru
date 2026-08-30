import 'result.dart';

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = '網路連線失敗，請檢查網路狀態']);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message = '認證失敗，無法存取資源']);
}

class ProviderFailure extends Failure {
  const ProviderFailure(super.message);
}

class LocalComicNotFoundFailure extends Failure {
  const LocalComicNotFoundFailure([super.message = '當前漫畫資料遺失']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = '發生未知的錯誤']);
}
