import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:8080';

  Future<Map<String, dynamic>> requestLoanDecision(String personalCode, int loanAmount, int loanPeriod) async {
    final response = await http.post(
      Uri.parse('$baseUrl/loan/decision'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'personalCode': personalCode,
        'loanAmount': loanAmount,
        'loanPeriod': loanPeriod,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      //TODO: Bad request, fix input fields
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      //TODO: No valid loan found
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}
