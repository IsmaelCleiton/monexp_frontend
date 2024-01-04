import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/auth/domain/failures/login_failure.dart';
import 'package:monexp_frontend/app/modules/auth/domain/failures/register_failure.dart';

class ApiClient {
  ApiClient(this._sessionService) {
    addInterceptors();
  }
  final Dio _dio = Dio();
  final SessionService _sessionService;

  void addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (options, request) {
        if (options.headers['Authorization'] != null) {
          Session? session = _sessionService.getSession();
          if (session != null) {
            options.headers['Authorization'] =
                'Token ${session.authentication.token}';
          }
        }

        return request.next(options);
      }),
    );
  }

  Future<Response> registerUser(Map<String, dynamic> userdata) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:8000/api/register/',
        data: userdata,
      );
      return response;
    } on DioException catch (e) {
      throw RegisterFailure('');
    }
  }

  Future<Response> login(Map<String, dynamic> loginData) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:8000/api/login/',
        data: loginData,
      );
      return response;
    } on DioException catch (e) {
      throw LoginFailure('');
    }
  }

  Future<Response> logout(String token) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:8000/api/logout/',
        options: Options(
          headers: {'Authorization': token},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> getUser(String token) async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:8000/api/get_user/',
        options: Options(
          headers: {'Authorization': "Token $token"},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> getLaboratories() async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:8000/api/laboratory/',
        options: Options(
          headers: {'Authorization': ''},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> getExperiments(int laboratory) async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:8000/api/experiment/',
        queryParameters: {'laboratory': laboratory},
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> getExperimentGroups() async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:8000/api/groupExperiment/',
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> getAnimal() async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:8000/api/animal/',
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> createLaboratory(String json) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:8000/api/laboratory/',
        data: json,
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> deleteLaboratory(int id) async {
    try {
      Response response = await _dio.delete(
        'http://127.0.0.1:8000/api/laboratory/$id',
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> createExperiment(String json) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:8000/api/experiment/',
        data: json,
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> deleteExperiment(int id) async {
    try {
      Response response = await _dio.delete(
        'http://127.0.0.1:8000/api/experiment/$id',
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> createExperimentGroup(String json) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:8000/api/group_experiment/',
        data: json,
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> deleteExperimentGroup(int id) async {
    try {
      Response response = await _dio.delete(
        'http://127.0.0.1:8000/api/group_experiment/$id',
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> createAnimal(String json) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:8000/api/animal/',
        data: json,
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }

  Future<Response> deleteAnimal(int id) async {
    try {
      Response response = await _dio.delete(
        'http://127.0.0.1:8000/api/animal/$id',
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw AppFailure('');
    }
  }
}
