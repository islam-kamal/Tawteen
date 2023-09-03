import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/models/AttachmentsModel/attachment_model.dart';
import 'package:code/src/data/models/AttachmentsModel/delete_attachment_delete.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
class AttachmentsRepository {
   Future<AttachmentModel?> getAllAttachments({String? applicationId, String? applicationTypeId }) async {
    Map<String, String> headers = {
      'lang': translator.activeLanguageCode,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG'
    };
    return NetworkUtil.internal().get(
        AttachmentModel(), baseUrl + "api/v1/attachments/all?"
        "applicationId=${applicationId}"
        "&applicationTypeId=${applicationTypeId}", headers: headers  );
  }

   Future<DeleteAttachmentModel?> deleteAttachment({String? attachmentId }) async {
     Map<String, String> headers = {
       'lang': translator.activeLanguageCode,
       'Content-Type': 'application/json',
       'Accept': 'application/json',
       'Accept-Language': translator.activeLanguageCode == 'ar' ? 'ar-EG' : 'en-EG'
     };
     return NetworkUtil.internal().delete(
         DeleteAttachmentModel(), baseUrl + "api/v1/attachments/${attachmentId}", headers: headers  );
   }


   Future<bool> uploadAttachment({String? title, String? refObj,String? refId, String? subRefId,
    String? refIdType ,List<PlatformFile>?  createAttachements,}) async {
    var headers = {'Authorization': 'Bearer TOKEN'}; // remove headers if not wanted
    var request = http.MultipartRequest(
        'POST', Uri.parse(baseUrl + uploadAttachmentsUrl)); // your server url
    request.fields.addAll({
      'Title': title!,
      'RefObj': refObj!,
      'RefId': refId!,
      'SubRefId': subRefId!,
      'RefIdType': refIdType!,

    }); // any other fields required by your server
    request.files
        .add(await http.MultipartFile.fromPath('CreateAttachements', '${createAttachements![0].path}')); // file you want to upload
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


   Future<bool> updateInitativeAttachment({String? title, String? refObj,String? refId, String? subRefId,
     String? refIdType ,List<PlatformFile>?  createAttachements,
     String? attachmentId }) async {
     var headers = {'Authorization': 'Bearer ${await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN)}'}; // remove headers if not wanted
     var request = http.MultipartRequest(
         'PUT', Uri.parse(baseUrl + "api/v1/attachments/$attachmentId")); // your server url
     request.fields.addAll({
       'Title': title!,
       'RefObj': refObj!,
       'RefId': refId!,
       'SubRefId': subRefId!,
       'RefIdType': refIdType!,

     }); // any other fields required by your server
     request.files
         .add(await http.MultipartFile.fromPath('CreateAttachements', '${createAttachements![0].path}')); // file you want to upload
     request.headers.addAll(headers);
     http.StreamedResponse response = await request.send();
     if (response.statusCode == 200) {
       return true;
     } else {
       return false;
     }
   }
}

final attachment_repository = AttachmentsRepository();