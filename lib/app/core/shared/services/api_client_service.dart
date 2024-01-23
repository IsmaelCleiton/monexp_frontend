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
  final String baseUrl = const String.fromEnvironment("BASE_URL");

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
        '$baseUrl/api/register/',
        data: userdata,
      );
      return response;
    } on DioException {
      throw RegisterFailure('Erro ao registrar usuário.');
    }
  }

  Future<Response> login(Map<String, dynamic> loginData) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/api/login/',
        data: loginData,
      );
      return response;
    } on DioException {
      throw LoginFailure('Erro ao realizar login.');
    }
  }

  Future<Response> logout(String token) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/api/logout/',
        options: Options(
          headers: {'Authorization': token},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao realizar o log out.');
    }
  }

  Future<Response> getUser(String token) async {
    try {
      Response response = await _dio.get(
        '$baseUrl/api/get_user/',
        options: Options(
          headers: {'Authorization': "Token $token"},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao acessar usuário.');
    }
  }

  Future<Response> getLaboratories() async {
    try {
      Response response = await _dio.get(
        '$baseUrl/api/laboratory/',
        options: Options(
          headers: {'Authorization': ''},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao acessar laboratórios.');
    }
  }

  Future<Response> getExperiments(int laboratory) async {
    try {
      Response response = await _dio.get(
        '$baseUrl/api/experiment/',
        queryParameters: {'laboratory': laboratory},
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao acessar experimentos.');
    }
  }

  Future<Response> getExperimentGroups() async {
    try {
      Response response = await _dio.get(
        '$baseUrl/api/groupExperiment/',
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao acessar grupo de experimentos.');
    }
  }

  Future<Response> getAnimal() async {
    try {
      Response response = await _dio.get(
        '$baseUrl/api/animal/',
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao acessar animais.');
    }
  }

  Future<Response> createLaboratory(String json) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/api/laboratory/',
        data: json,
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao criar laboratório.');
    }
  }

  Future<Response> deleteLaboratory(int id) async {
    try {
      Response response = await _dio.delete(
        '$baseUrl/api/laboratory/$id/',
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao deletar laboratório.');
    }
  }

  Future<Response> createExperiment(String json) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/api/experiment/',
        data: json,
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao deletar experimento.');
    }
  }

  Future<Response> deleteExperiment(int id) async {
    try {
      Response response = await _dio.delete(
        '$baseUrl/api/experiment/$id/',
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao deletar experimento.');
    }
  }

  Future<Response> createExperimentGroup(String json) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/api/group_experiment/',
        data: json,
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao criar grupo de experimento.');
    }
  }

  Future<Response> deleteExperimentGroup(int id) async {
    try {
      Response response = await _dio.delete(
        '$baseUrl/api/group_experiment/$id/',
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao deletar grupo de experimento.');
    }
  }

  Future<Response> createAnimal(String json) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/api/animal/',
        data: json,
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao criar animal.');
    }
  }

  Future<Response> deleteAnimal(int id) async {
    try {
      Response response = await _dio.delete(
        '$baseUrl/api/animal/$id/',
        options: Options(
          headers: {'Authorization': ""},
        ),
      );
      return response;
    } on DioException {
      throw AppFailure('Erro ao deletar animal.');
    }
  }

  Future<Response> updateLaboratory(int id, String json) async {
    try {
      Response response = await _dio.put('$baseUrl/api/laboratory/$id/',
      data: json,
          options: Options(headers: {'Authorization': ''}));
      return response;
    } on DioException {
      throw AppFailure('Erro ao atualizar laboratório.');
    }
  }

  Future<Response> updateExperiment(int id, String json) async {
    try {
      Response response = await _dio.put('$baseUrl/api/experiment/$id/',
      data: json,
          options: Options(headers: {'Authorization': ''}));
      return response;
    } on DioException {
      throw AppFailure('Erro ao atualizar experimento.');
    }
  }

  Future<Response> updateExperimentGroup(int id, String json) async {
    try {
      Response response = await _dio.put('$baseUrl/api/group_experiment/$id/',
      data: json,
          options: Options(headers: {'Authorization': ''}));
      return response;
    } on DioException {
      throw AppFailure('Erro ao atualizar grupo de experimento.');
    }
  }

  Future<Response> updateAnimal(int id, String json) async {
    try {
      Response response = await _dio.put('$baseUrl/api/animal/$id/',
          data: json, options: Options(headers: {'Authorization': ''}));
      return response;
    } on DioException {
      throw AppFailure('Erro ao atualizar animal.');
    }
  }
}
