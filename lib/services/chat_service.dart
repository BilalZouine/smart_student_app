import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_student_app/models/chat_response.dart';

part 'chat_service.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:6000")
abstract class ChatService {
  factory ChatService(Dio dio, {String baseUrl}) = _ChatService;

  @POST("/chat")
  Future<ChatResponse> sendMessage(@Body() Map<String, dynamic> body);
}
