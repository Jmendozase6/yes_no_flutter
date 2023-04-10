import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/chat/yes_no_model.dart';

class GetYesNoAnswer {
  final Dio _dio = Dio();

  /// YesNoWtf API endPoint
  final String _endoPoint = 'https://yesno.wtf/api';

  /// This method returns a [Message] from API as Future<Message>
  Future<Message> getAnswer() async {
    /// Make the request to the API
    final response = await _dio.get(_endoPoint);

    /// If the request is successful [Status Code == 200]
    /// Return the message
    if (response.statusCode == 200) {
      final yesNoModel = YesNoModel.fromJson(response.data);

      /// Create a message using the response from the API
      return yesNoModel.toMessageEntity();
    }

    /// Return a wrong message if status code is not 200
    return Message(
      text: 'Something went wrong ${response.statusMessage}',
      fromWho: FromWho.hers,
    );
  }
}
