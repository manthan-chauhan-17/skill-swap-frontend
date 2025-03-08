import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(
    baseUrl:
        'http://172.20.10.2:6000/api/') // with ip address for physical device
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @POST('/auth/register')
  Future signInUser(
    @Body() Map<String, dynamic> userData,
  );

  @POST('/auth/login')
  Future loginUser(
    @Body() Map<String, dynamic> credentials,
  );
}
