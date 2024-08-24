// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      success: json['success'] as bool,
      code: (json['code'] as num).toInt(),
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'data': toJsonT(instance.data),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _WebServices implements WebServices {
  _WebServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://srv568036.hstgr.cloud/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse<List<CompanyType>>> getCompaniesTypes() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<CompanyType>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'get-company_type',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = ApiResponse<List<CompanyType>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<CompanyType>(
                  (i) => CompanyType.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return _value;
  }

  @override
  Future<ApiResponse<List<CompanyTitle>>> getCompaniesTitles() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<CompanyTitle>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'get-titles',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = ApiResponse<List<CompanyTitle>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<CompanyTitle>(
                  (i) => CompanyTitle.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return _value;
  }

  @override
  Future<ApiResponse<List<CompanyCountryNational>>>
      getCompaniesCountries() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<CompanyCountryNational>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'get-countries',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = ApiResponse<List<CompanyCountryNational>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<CompanyCountryNational>((i) =>
                  CompanyCountryNational.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return _value;
  }

  @override
  Future<ApiResponse<Company>> getCompanyById(int companyId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'company_id': companyId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<Company>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'company/get-company/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = ApiResponse<Company>.fromJson(
      _result.data!,
      (json) => Company.fromJson(json as Map<String, dynamic>),
    );
    return _value;
  }

  @override
  Future<ApiResponse<bool>> deleteCompany(Map<String, int> companyData) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(companyData);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResponse<bool>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'company/delete-company',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = ApiResponse<bool>.fromJson(
      _result.data!,
      (json) => json as bool,
    );
    return _value;
  }

  @override
  Future<ApiResponse<dynamic>> updateCompany(
      Map<String, dynamic> companyDataToUpdate) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(companyDataToUpdate);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'company/update-company',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = ApiResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return _value;
  }

  @override
  Future<ApiResponse<List<CompanyInfoFromApi>>> getAllCompanies() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<CompanyInfoFromApi>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'company/get-companies',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = ApiResponse<List<CompanyInfoFromApi>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<CompanyInfoFromApi>(
                  (i) => CompanyInfoFromApi.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return _value;
  }

  @override
  Future<dynamic> createCompany(Company company) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    // Convert company data to a Map
    Map<String, dynamic> companyData = company.toJson();

    // Add image data to FormData
    MultipartFile? multipartFile;
    if (company.picture is Uint8List) {
      // Handle web image data
      multipartFile = MultipartFile.fromBytes(
        company.picture,
        filename: 'company_picture.png', // Adjust the filename as needed
      );
    } else if (company.picture is File) {
      // Handle mobile image data
      multipartFile = await MultipartFile.fromFile(
        company.picture.path,
        filename: company.picture.path.split('/').last,
      );
    }

    // Add image data to companyData if needed
    companyData['picture'] = multipartFile;

    // Create FormData
    FormData formData = FormData.fromMap(companyData);
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'company/create-company',
          queryParameters: queryParameters,
          data: formData,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final _value = _result.data;
    return _value;
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

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
