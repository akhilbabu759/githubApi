import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:github_api/common/api/api.dart';
import 'package:github_api/home/model/model.dart';



class Service {
  final dio = Dio();
  final abaseUrl = Api();

  Future<List<Repository>?> getApi(bool valu) async {
     

    try {
      Response response = await dio.get(abaseUrl.apiUrl+(valu?('2023-06-01') :'2023-07-01')+abaseUrl.apiEnd);
      log('response geted');
      log(response.data["items"].toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('entered to if condition in statuscode');

        // Check if the "items" key is not null before mapping it to a list
        final itemsData = response.data["items"];
        if (itemsData != null && itemsData is List) {
          final List<Repository> data = itemsData
              .map(
                (itemData) => Repository(
                  name: itemData["name"],
                  description: itemData["description"] ?? '',
                  stars: itemData["stargazers_count"],
                  ownerUsername: itemData["owner"]["login"],
                  ownerAvatarUrl: itemData["owner"]["avatar_url"],
                ),
              )
              .toList();
          log(data.length.toString());
          return data;
        } else {
          log('items data is null or not a list');
        }
      } else {
        log('entered in else case');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
