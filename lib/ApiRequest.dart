import 'dart:convert' as convert;


import 'package:e_com/ApiResponce.dart';
import 'package:http/http.dart' as http;


class ApiRequest {
  Future<ApiResponce> apiRequestGet(url) async 
  {
    return await http.get(Uri.parse(url), headers: null).then((response) 
    {
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        return ApiResponce(data: jsonResponse, errorMessage: '');
      } else if (response.statusCode == 208) {
        var jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse);
        return ApiResponce(
            error: true,
            errorMessage: "Somthing went wrong",
            statusCode: response.statusCode,
            data: null);
      } else {
        
        return ApiResponce(
            error: true,
            errorMessage: "Somthing went wrong",
            statusCode: response.statusCode,
            data: null);
      }
    })
    .catchError((err) {
      return ApiResponce(
          error: true, statusCode: 500, data: null, errorMessage: '');
    });
  }

 
}
