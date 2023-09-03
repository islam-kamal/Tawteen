import 'dart:async';

import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/repositories/AttachmentsRepo/attachments_repository.dart';
import 'package:code/src/domain/entities/user_eduction_entity.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc extends Bloc<AppEvent,AppState> with Validator{

  SignUpBloc():super(Start()){
    on<click>(_onSignUpClick);
  }






  Future<void> _onSignUpClick(click event , Emitter<AppState> emit)async{
    emit( Loading(model: null));
    var response = await AuthenticationRepository.signUp(
      userEductionEntity: event.userEductionEntity
    );
    if(response.httpStatusCode == 200 || response.httpStatusCode == 201){


      emit( Done(model: response));

      event.signup_attachments!.forEach((element)async {

        await attachment_repository.uploadAttachment(
            title: element.filename,
            refId: response.data.toString(),
            refIdType: "1",
            refObj: "3",
            subRefId: "0",
            createAttachements: element.files);
      });

    }else{
      emit( ErrorLoading(model: response,message: response.message));
    }

  }




}

SignUpBloc signUpBloc = new SignUpBloc();


