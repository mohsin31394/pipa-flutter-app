import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pipa/helping_materials/app_constants.dart';
import 'package:pipa/helping_materials/helping_material.dart';
List? user;
String? tokens;
bool internetConStatus = false;

_initilizeHeaders(BuildContext context, {bool authToken = false}) async {
  Map<String, String> apiHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if (authToken) 'Authorization': 'Bearer ${tokens!}',
  };
  return apiHeaders;
}

processResponse(response, BuildContext context, String funName) async {
  //print('Api Response: ${response.body}');
  print(response.statusCode);
  var _response = await jsonDecode(response.body);
  if (response.statusCode == 200) {
    print(_response);
    // showSnackBar(_response['message'], context);
    return jsonDecode(response.body);
  } else {
    // showSnackBar('Please enter correct credentials', context);
    print('Else condition: ${response.body}');
    // if (funName.contains('social/login')) {
    //   showAlert(_response['message'], context);
    // } else if (funName.contains('register')) {
    //   showAlert(_response['data']['email'][0], context);
    // } else if (funName.contains('login')) {
    //   showAlert('Please enter correct details', context);
    // } else if (funName.contains('forget')) {
    //   showAlert('this Account not exist Create new Account...', context);
    // } else if (funName.contains('/customer/update')) {
    //   showAlert(_response['message'], context);
    // }else if (funName.contains('admin/business/loyalty_offer/status/')) {
    //   showAlert(_response['data']['Offer'][0], context);
    // }else if(funName.contains('customer/collect/offers/stamp')){
    //   if(_response['message'].toString().contains('Validation Error')){
    //     showAlert('No schemme Available for this TAG...', context);
    //   }else{
    //     showAlert(_response['message'], context);
    //   }
    //
    // }

    return null;
  }
}

class Network {
  static get(String route, BuildContext context, String token,
      {authToken = false}) async {
    internetConStatus = await checkInternetConnection();
    if (internetConStatus) {
      tokens = token;
      Map<String, String> apiHeaders =
          await _initilizeHeaders(context, authToken: authToken);
      // print(">>>>>"+apiHeaders.toString());

      try {
        var response = await http.get(
          Uri.parse('${AppContsants.baseURL}$route'),
          headers: apiHeaders,
        );
        // print('response : ${response.body.toString()}');
        return await processResponse(response, context, route);
      } catch (e) {
        return null;
      }
    } else {
      showAlert('Check your Internet Connection...', context);
      return null;
    }
  }

  static post(String route, BuildContext context,
      {payload,
      bool useOldUrl = false,
      String? token,
      authToken = false}) async {
    internetConStatus = await checkInternetConnection();
    if (internetConStatus) {
      tokens = token;
      if (payload != null) {
        print('Payload: $payload');
      }
      Map<String, String> apiHeaders =
          await _initilizeHeaders(context, authToken: authToken);
      print('apiHeaders : $apiHeaders');

      String body = jsonEncode(payload);
      try {
        print("before calling");
        var response = await http.post(
            Uri.parse('${AppContsants.baseURL}$route'),
            headers: apiHeaders,
            body: body);
        print("after calling");
        return processResponse(response, context, route);
      } catch (e) {
        // oneButtonDialog(
        //     context, AppLocalizations.of(context).error, e.toString());
        return null;
      }
    } else {
      showAlert('Check your Internet Connection...', context);
      return null;
    }
  }

  static put(String route, BuildContext context, {payload}) async {
    internetConStatus = await checkInternetConnection();
    if (internetConStatus) {
      Map<String, String> apiHeaders = await _initilizeHeaders(context);

      String body = jsonEncode(payload);

      try {
        var response = await http.put(Uri.parse('apiUrl$route'),
            headers: apiHeaders, body: body);

        return processResponse(response, context, route);
      } catch (e) {
        // oneButtonDialog(
        //     context, AppLocalizations.of(context).error, e.toString());
        return;
      }
    } else {
      showAlert('Check your Internet Connection...', context);
      return null;
    }
  }

  static delete(String route, BuildContext context, {payload}) async {
    internetConStatus = await checkInternetConnection();
    if (internetConStatus) {
      Map<String, String> apiHeaders = await _initilizeHeaders(context);

      String body = jsonEncode(payload);

      try {
        var response = await http.delete(Uri.parse('apiUrl$route'),
            headers: apiHeaders, body: body);

        return processResponse(response, context, route);
      } catch (e) {
        // oneButtonDialog(
        //     context, AppLocalizations.of(context).error, e.toString());
        return;
      }
    } else {
      showAlert('Check your Internet Connection...', context);
      return null;
    }
  }
}
