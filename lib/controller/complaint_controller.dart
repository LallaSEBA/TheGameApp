<<<<<<< HEAD
class ComplaintController{
}
=======
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shaths_app_thegame/models/complaint.dart';

class ComplaintController {
  //هذا غادي نكتب فيه كل اللوجييك نتاع الشكوى 'منصف'
  Future<bool> addAComplaint(
      String type, String subject, String details, String section,
      [String suggestion]) async {
    var body = {
      "type": type,
      "subject": subject,
      "details": details,
      "suggestion": suggestion,
      "section": section,
    };

    String myUrl = "https://maak-app.herokuapp.com/api/user/requests";
    try {
      final response = await http.post(myUrl,
          headers: {'Accept': 'application/json'}, body: body);
      var data = json.decode(response.body);
      if (data != null && data["success"] == true) {
        return true;
      }
      return false;
    } catch (e) {
      print(e.message());
    }
  }

  Future<List<Complaint>> getComplaintsWithType(
      String token, String type) async {
    try {
      String myUrl =
          "https://maak-app.herokuapp.com/api/employee/requests/filter-by-type";

      var body = {"type": type};
      final response = await http.post(myUrl,
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body);
      var data = json.decode(response.body);
      if (data != null && data["success"] == true) {
        List<Complaint> complaints;
        for (Map<String, dynamic> complaint in data["data"]) {
          complaints.add(Complaint(
              complaint["id"],
              complaint["employee_id"],
              complaint["details"],
              complaint["section"],
              complaint["subject"],
              complaint["type"],
              complaint["user_email"]));
        }

        return complaints;
      }
      return [];
    } catch (e) {
      print(e.message());
    }
  }

  Future<List<Complaint>> getAllComplaints(String token) async {
    try {
      String myUrl = "https://maak-app.herokuapp.com/api/employee/requests";

      final response = await http.post(
        myUrl,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var data = json.decode(response.body);
      if (data != null && data["success"] == true) {
        List<Complaint> complaints;
        for (Map<String, dynamic> complaint in data["data"]) {
          complaints.add(
            Complaint(
              complaint["id"],
              complaint["employee_id"],
              complaint["details"],
              complaint["section"],
              complaint["subject"],
              complaint["type"],
              complaint["user_email"],
            ),
          );
        }

        return complaints;
      }
      return [];
    } catch (e) {
      print(e.message());
    }
  }

  Future<Complaint> getACertainRequest(String token, int id) async {
    try {
      String myUrl = "https://maak-app.herokuapp.com/api/employee/requests/$id";

      final response = await http.post(
        myUrl,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var data = json.decode(response.body);
      if (data != null && data["success"] == true) {
        return Complaint(
          data["data"]["id"],
          data["data"]["employee_id"],
          data["data"]["details"],
          data["data"]["section"],
          data["data"]["subject"],
          data["data"]["type"],
          data["data"]["user_email"],
        );
      }
      return null;
    } catch (e) {
      print(e.message());
    }
  }

  Future<bool> isSolved(String token, int id) async {
    try {
      String myUrl = "https://maak-app.herokuapp.com/api/employee/requests/$id/change-status-to-solved";

      final response = await http.post(
        myUrl,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var data = json.decode(response.body);
      if (data != null && data["success"] == true) {
        return true;
      }
      return false;
    } catch (e) {
      print(e.message());
    }
  }
}
>>>>>>> 8e93677ef0e16119298463cba2e158ddc65c642e
