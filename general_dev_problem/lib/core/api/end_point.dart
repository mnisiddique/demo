abstract class EndPoint<T> {
  final String baseUrl = "https://go.to.hell";
  String path(T pathParam);

  String build(T pathParam, {Map<String, dynamic>? queryParam}) {
    return Uri.parse(baseUrl)
        .replace(
          queryParameters: queryParam,
          path: path(pathParam),
        )
        .toString();
  }
}

class FtPathParam {
  final String vApi;
  final String vTrfType;

  FtPathParam({
    required this.vApi,
    required this.vTrfType,
  });

  String get accountId => "a-cc-ou-nt-id";
}

class FtEndPoint extends EndPoint<FtPathParam> {
  @override
  String path(FtPathParam pathParam) {
    return "${pathParam.vApi}/banks/010/${pathParam.vTrfType}/accounts/${pathParam.accountId}";
  }
}

class AnyGeneralEndPoint extends EndPoint<void> {
  @override
  String path(void pathParam) {
    return "v1/banks/010/get-limit";
  }
}

void meth() {
  final ep = AnyGeneralEndPoint();
  ep.path(null);
  ep.build(null);
}
