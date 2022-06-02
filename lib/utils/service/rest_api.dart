import 'dart:convert';
import 'dart:io';
import 'package:azelpo/constants/api_path.dart';
import 'package:azelpo/models/data_model.dart';
import 'package:azelpo/models/professional_model.dart';
import 'package:azelpo/models/service_category_model.dart';
import 'package:azelpo/models/service_provider_model.dart';
import 'package:azelpo/models/service_subcategory_model.dart';
import 'package:http/http.dart' as http;

class Services {
  static Map<String, String> get _restApiHeader => <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      };


  //sign in api
  static Future<Data> signIn(Map<String,dynamic>body) async {
    Uri url = Uri.http(Urls.baseUrl, Urls.signIn);
    try {
      final response = await http.post(url, headers: _restApiHeader,body: jsonEncode(body));
      final jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200)
      {
        return Data.fromResponse(jsonResponse);
      }
      return Data.fromResponse(jsonResponse);
      } catch (_) {
      return Data.fromException(_);
    }
  }


  //signUp Api
  static Future<Data> signUp(Map<String,dynamic>body) async {
    Uri url = Uri.http(Urls.baseUrl, Urls.signUp);
    try {
      final response = await http.post(url, headers: _restApiHeader,body: jsonEncode(body));
      final jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200)
      {
        return Data.fromResponse(jsonResponse);
      }
      return Data.fromResponse(jsonResponse);
      } catch (_) {
      return Data.fromException(_);
    }
  }


  // Service Category Api
  static Future<Data<List<ServiceCategoriesModel>>> serviceCategory() async {
    Uri url = Uri.http(Urls.baseUrl, Urls.serviceCategory);
    try {
      final response = await http.get(url, headers: _restApiHeader);
      final jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200)
      {
        final products = <ServiceCategoriesModel>[];
        if (jsonResponse['data']['categories']['data'] != null) {
          jsonResponse['data']['categories']['data'].forEach((v) {
            products.add(ServiceCategoriesModel.fromJson(v));
          });
        }
        return Data.fromResponse(response).copyWith(data: products);
      }
      return Data.fromResponse(response);
    } catch (_) {
      return Data.fromException(_);
    }
  }


  //Service SubCategory Api
  static Future<Data<List<ServiceSubCategoryModel>>> serviceSubCategory() async {
    Uri url = Uri.http(Urls.baseUrl, Urls.serviceSubCategory);
    try {
      final response = await http.get(url, headers: _restApiHeader);
      final jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200)
      {
        final products = <ServiceSubCategoryModel>[];
        if (jsonResponse['data']['categories']['data'] != null) {
          jsonResponse['data']['categories']['data'].forEach((v) {
            products.add(ServiceSubCategoryModel.fromJson(v));
          });
        }
        return Data.fromResponse(response).copyWith(data: products);
      }
      return Data.fromResponse(response);
    } catch (_) {
      return Data.fromException(_);
    }
  }


  //Service Provider Api
  static Future<Data<List<ServiceProviderModel>>> getServiceProvider() async {
    Uri url = Uri.http(Urls.baseUrl, Urls.getServiceProvider);
    try {
      final response = await http.get(url, headers: _restApiHeader);
      final jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200)
      {
        final products = <ServiceProviderModel>[];
        if (jsonResponse['data']['service_provider']['data'] != null) {
          jsonResponse['data']['service_provider']['data'].forEach((v) {
            products.add(ServiceProviderModel.fromJson(v));
          });
        }
        return Data.fromResponse(response).copyWith(data: products);
      }
      return Data.fromResponse(response);
    } catch (_) {
      return Data.fromException(_);
    }
  }


  // professional Api
  static Future<Data<List<ProfessionalModel>>> getProfessional() async {
    Uri url = Uri.http(Urls.baseUrl, Urls.getProfessional);
    try {
      final response = await http.get(url, headers: _restApiHeader);
      final jsonResponse = jsonDecode(response.body);
      if(response.statusCode == 200)
      {
        final products = <ProfessionalModel>[];
        if (jsonResponse['data']['categories']['data'] != null) {
          jsonResponse['data']['categories']['data'].forEach((v) {
            products.add(ProfessionalModel.fromJson(v));
          });
        }
        return Data.fromResponse(response).copyWith(data: products);
      }
      return Data.fromResponse(response);
    } catch (_) {
      return Data.fromException(_);
    }
  }

}
