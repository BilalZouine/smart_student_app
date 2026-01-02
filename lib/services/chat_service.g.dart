// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ChatService implements ChatService {
  _ChatService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://10.0.2.2:6000';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ChatResponse> sendMessage(Map<String, dynamic> body) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = body;

    final result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<ChatResponse>(
        Options(method: 'POST', headers: headers, extra: _extra)
            .compose(
              _dio.options,
              '/chat',
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );

    final value = ChatResponse.fromJson(result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
