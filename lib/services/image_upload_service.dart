import 'dart:io';
import 'package:dio/dio.dart';

import '../models/respones_model.dart';

class ImageUploadService {
  static final Dio _dio = Dio();

  static Future<ApiResponse> uploadImage(File imageFile) async {
    try {
      FormData formData = FormData.fromMap({
        'img':
            await MultipartFile.fromFile(imageFile.path, filename: 'image.jpg'),
      });

      Response response =
          await _dio.post('https://flutter.prominaagency.com/api/upload',
              data: formData,
              options: Options(
                headers: {
                  HttpHeaders.authorizationHeader:
                      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOGMyYjI3NmYyN2M0Y2Y2YjZmNzcxOWQ2NDE1MDAwYmYxZGUzZWFiMWVjMmJmM2M1YzllYjZhZDA5YmJkZDJjMGFkZTNjMDllMGMwNjgxYTAiLCJpYXQiOjE3MTIwOTI3NTEuMzI0MDg3LCJuYmYiOjE3MTIwOTI3NTEuMzI0MDg4LCJleHAiOjE3NDM2Mjg3NTEuMzIwMTEsInN1YiI6IjIzMCIsInNjb3BlcyI6W119.VkvxN3uMOif5NUTi3OgZajWwhrLKneKEraXPdFpsMY7CwZaZd_w_ewsgjrQyQt5M9Lpm--epAJH4e4D3tzAxgCwG1Lsc3uJIjp6rAf0MyE35E0BBrQCyg79yC8OwvmvPlyAw0KsSW8MW7EfIlVnW6dlQ7E1k4kqpRQOmCJqXQGevhTaRhgVFBUykpSIhOG_MRgiZ2pAOnfSIJGAReivihyNJfPjUT0Kqsq04FG2Be08gY9wAFuHOn9TEi4dArhBI-9zaOFwy97PeeVHNA5-4vZ0YlARtp00GVCEqA1imsn1z8z-S_6ZnoZYkvoIC6z_u8R_lvvRlYZDOIR8lD7Su0APlmZ09lLuUNl6KV_liDBgfX_0rVjwLHntSMP-Jz5vAHlmfqUPpVzpfMXiqSueJ18ExkY_VeJlCrIbFaN7PIV8TI8MVO-0SNADyxRF9pgg7OZBw9JgW5vvsr-8QF5cX0cdIZZCnCXSNDvrYRa6jDOGZLEypWjt74VFgwI_NDOgqXHmD5WFx3JAxm5yle1rUig-N6RuYz7nU0IKZVpaJjH4jAI065m_pXQz6qv70aD_svPWOjOzaRLY8PY4aAzbtMzleVZU06nTd0wfn6G91goICm5SayzUaw_c0mnfNze_KykPXapSPOQvqDEjrj8pI52vmjddKAgKYAEy4pYRMph4', 
                },
              ));

      if (response.statusCode == 200) {
        return ApiResponse.fromJson(
            {"success": true, "message": "Image uploaded successfully"});
      } else {
        return ApiResponse.fromJson({
          "success": false,
          "message":
              "Failed to upload image. Error code: ${response.statusCode}"
        });
      }
    } catch (e) {
      return ApiResponse.fromJson(
          {"success": false, "message": "Error uploading image: $e"});
    }
  }
}
