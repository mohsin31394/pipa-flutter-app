// import 'dart:convert';
// import 'dart:io';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pipa/helping_materials/app_constants.dart';
import 'package:pipa/helping_materials/helping_material.dart';
import 'package:pipa/network/network_services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ApiCaller {
  final BuildContext _context;
  static var token;
  static bool userVerify = false;
  bool internetConStatus = false;

  ApiCaller(this._context);

  login(String email, String passward) async {
    var data = {"email": email, "password": passward};
    var body = await Network.post('/login', _context, payload: data);
    if (body != null) {
      // var dataUpdated = usersDataFormat(
      //     email: email,
      //     name: body['data']['name'],
      //     photoURL: body['data']['img_url'],
      //     token: body['data']['token'],
      //     type: body['data']['type'],
      //     dob: body['data']['dob'],
      //     gender: body['data']['gender']);
      // Provider.of<Users>(_context, listen: false)
      //     .updateUserData(user: dataUpdated);
      // setUserDataInSharePre(dataUpdated);
    }
    print('body : $body');
    return body;
  }

  socialLogin(
      {name, email, profile_url, social_token, gender, dob, provider}) async {
    var data;
    if (provider != 'apple' && provider != 'Apple') {
      data = {
        "name": name.toString(),
        "email": email.toString(),
        "profie_image_url": profile_url.toString(),
        "social_token": social_token.toString(),
        "provider": provider.toString(),
        "gender": gender.toString(),
        "dob": dob.toString(),
        "type": 3
      };
    } else {
      data = {
        "name": name.toString(),
        "email": email.toString(),
        "social_token": social_token.toString(),
        "provider": provider.toString(),
        "gender": gender.toString(),
        "dob": dob.toString(),
        "type": 3
      };
    }

    var body = await Network.post('/social/login', _context, payload: data);

    if (body != null) {
      print('data != null');
      // var dataUpdated = usersDataFormat(
      //     email: email,
      //     name: name,
      //     token: body['data']['token'],
      //     type: body['data']['type'],
      //     gender: gender.toString(),
      //     photoURL: profile_url,
      //     dob: dob);
      // Provider.of<Users>(_context, listen: false)
      //     .updateUserData(user: dataUpdated);
      // setUserDataInSharePre(dataUpdated);
    }
    print('body : $body');
    return body;
  }

  signup({email, name, passward, gender, dob}) async {
    var data = {
      "email": email,
      "name": name,
      "password": passward,
      "gender": gender,
      "dob": dob,
      "type": 3
    };
    var body = await Network.post('/register', _context, payload: data);
    print('body : $body');
    if (body != null) {
      // var data = usersDataFormat(
      //     email: email,
      //     name: body['data']['name'],
      //     token: body['data']['token'],
      //     type: body['data']['type'],
      //     gender: gender,
      //     dob: dob);
      // Provider.of<Users>(_context, listen: false).updateUserData(user: data);
      // setUserDataInSharePre(data);
    }
    return body;
  }

  forgetPassword({email}) async {
    var data = {"email": email};
    var body = await Network.post('/forget', _context, payload: data);

    return body;
  }

  verifyEmail(berearToken) async {
    var body = await Network.get(
        '/check/email', _context, berearToken.toString(),
        authToken: true);
    return body;
  }

  Future updateTest(String berearToken, {profileImg, name, dob, gender}) async {
    internetConStatus = await checkInternetConnection();
    if (internetConStatus) {
      var data;
      var headers = {
        'Authorization': "Bearer " + berearToken
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${AppContsants.baseURL}/customer/update'));
      request.fields.addAll({
        'name': name,
        'dob': dob,
        'gender': gender
      });
      if (profileImg != null) {
        request.files.add(await http.MultipartFile.fromPath('img', profileImg));
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      data =
      await response.stream.transform(utf8.decoder).listen((value) async {
        //  (value.toString());
        var decodedData = json.decode(value.toString());
        print(decodedData.toString() + ">>>>>>>>>>>>>>>>>>>>>>>>>");
        var data = decodedData['data'];
        print(data);
        if (decodedData != null) {
          print('image is :' + decodedData['data']['img_url']);
          return data;
        }

      });
      return data;
    } else {
      showAlert('Check your Internet Connection...', _context);
      return null;
    }
  }

  // Future checkUserExist(email, context, res, loginMethod) async {
  //   var body = await Network.post(
  //       '/user_status', _context, payload: {"email": email}, authToken: false);
  //   if (body != null) {
  //     var data = usersDataFormat(
  //       email: email,
  //       photoURL: body['data']['img_url'],
  //       name: body['data']['name'],
  //       dob: body['data']['dob'],
  //       phoneNo: body['data']['phone'].toString(),
  //       gender: body['data']['gender'],
  //       token: body['data']['token'],
  //       type: body['data']['type'],
  //     );
  //     print('body : $body');
  //
  //     Provider.of<Users>(_context, listen: false).updateUserData(user: data);
  //     setUserDataInSharePre(data);
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()));
  //   } else {
  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) =>
  //             PostSigninScreen(loginMethod: loginMethod, userInfo: res,)));
  //   }
  // }

  updateProfile(berearToken, {profileImg, name, dob, gender}) async {
    var data = {
      "img": profileImg,
      "name": name,
      "dob": dob,
      "gender": gender,
    };
    print(">>>" + berearToken.toString());
    var body = await Network.post(
        '/customer/update', _context, token: berearToken.toString(),
        payload: data,
        authToken: true);
    if (body != null) {
      print('image is :' + body['data']['img_url']);

      // var data = usersDataFormat(
      //   photoURL: body['data']['img_url'],
      //   name: body['data']['name'],
      //   dob: body['data']['dob'],
      //
      //
      //   gender: body['data']['gender'],
      //   token: berearToken,
      //   type: body['data']['role_name'],
      // );
      //
      // Provider.of<Users>(_context, listen: false).updateUserData(user: data);
    }
    return body;
  }

  Future activeBusiness(berearToken) async {
    var body = await Network.get(
        '/admin/all_loyalty_offers/approved', _context, berearToken.toString(),
        authToken: true);
    print('active business $body');
    // if(body!=null){
    //   print('body');
    //   Provider.of<ActiveBusiness>(_context).updateActiveBusinessData(business: body);
    // }

    return body;
  }

  Future pendingBusiness(berearToken) async {
    var body = await Network.get(
        '/admin/all_loyalty_offers/pending', _context, berearToken.toString(),
        authToken: true);
    print('active business $body');
    // if(body!=null){
    //   print('body');
    //   Provider.of<ActiveBusiness>(_context).updateActiveBusinessData(business: body);
    // }

    return body;
  }


  Future singlePendingBusinessDetails(berearToken, businessId) async {
    var body = await Network.get(
        '/admin/business/${businessId.toString()}/loyalty_offers/pending',
        _context, berearToken.toString(),
        authToken: true);
    print('single business business ${body['data']['pending_schemes']}');
    // if(body!=null){
    //   print('body');
    //   Provider.of<ActiveBusiness>(_context).updateActiveBusinessData(business: body);
    // }

    return body;
  }

  Future singleActiveBusinessDetails(berearToken, businessId) async {
    var body = await Network.get(
        '/admin/business/${businessId.toString()}/loyalty_offers/approved',
        _context, berearToken.toString(),
        authToken: true);
    print('single business business ${body['data']['approved_schemes']}');
    // if(body!=null){
    //   print('body');
    //   Provider.of<ActiveBusiness>(_context).updateActiveBusinessData(business: body);
    // }

    return body;
  }

  Future schemmeDetails(berearToken, schemmeId) async {
    var body = await Network.get(
        '/admin/business/loyalty_offer/${schemmeId.toString()}', _context,
        berearToken.toString(),
        authToken: true);
    print('schemme Details ${body['data']}');

    return body;
  }

  discoverListView(String berearToken, String lat, String long) async {
    var data = {
      "lat": lat,
      "lon": long,
    };

    var body = await Network.post(
        '/customer/offers', _context, token: berearToken.toString(),
        payload: data,
        authToken: true);
    print('body : $body');
    return body;
  }

  nfcReadOverApi(String berearToken, String nfcId) async {
    var data = {
      "nfc_id": nfcId
    };

    var body = await Network.post(
        '/customer/collect/offers/stamp', _context, token: berearToken.toString(),
        payload: data,
        authToken: true);
    print('body : $body');
    return body;
  }


  Future walletApi(berearToken) async {
    var body = await Network.get(
        '/customer/collect/offers', _context, berearToken.toString(),
        authToken: true);
    print('body Wallet : $body');

    return body;
  }

  Future deleteAccount(berearToken) async {
    var body = await Network.get(
        '/customer/delete', _context, berearToken.toString(),
        authToken: true);
    print('body Delete Account : $body');

    return body;
  }

  Future getCategoryList(berearToken) async {
    var body = await Network.get(
        '/customer/categories', _context, berearToken.toString(),
        authToken: true);
    print('body Category List : $body');

    return body;
  }

  rewardColleted(String berearToken, int customerLoyaltyId) async {
    var data = {
      "customer_loyalty_id": customerLoyaltyId,
    };

    var body = await Network.post(
        '/customer/collect_reward', _context, token: berearToken.toString(),
        payload: data,
        authToken: true);

    return body;
  }

  tagAssign(String berearToken,
      {businessId, locationId, schemmeId, nfcId}) async {
    var data = {
      "business_id": businessId,
      "business_location_id": locationId,
      "nfc_detail": nfcId
    };

    var body = await Network.post(
        '/admin/business/loyalty_offer/status/${schemmeId.toString()}',
        _context, token: berearToken.toString(),
        payload: data,
        authToken: true);
    print('body : $body');
    return body;
  }

  contactUsApi(String berearToken,
      {name,email,category_id, describe}) async {
    var data = {
      "name":name,
      "email": email,
      "category_id": category_id,
      "describe": describe
    };

    var body = await Network.post(
        '/customer/support',
        _context, token: berearToken.toString(),
        payload: data,
        authToken: true);
    print('body : $body');
    return body;
  }
}
