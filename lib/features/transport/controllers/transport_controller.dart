import 'dart:convert';

import 'package:get/get.dart';
import 'package:semis/models/transport.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TransportController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<Transport?> transportData = Rx<Transport?>(null);

  Future<void> fetchTransportRecord() async {
    isLoading.value = true;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final stdID = prefs.getString('stdID');
      final schoolUrl = prefs.getString('schoolUrl');
      final url = Uri.parse('${schoolUrl}std_transport?stdID=$stdID');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        if (jsonResponse.isNotEmpty) {
          transportData.value = Transport.fromJson(jsonResponse[0]);
        } else {
          throw Exception('No data available');
        }
      } else {
        throw Exception('Failed to fetch data from the API');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
