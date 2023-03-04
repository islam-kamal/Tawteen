import 'dart:async';

import 'package:code/src/Base/common/file_export.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc extends Bloc<AppEvent,AppState> with Validator{

  SignUpBloc():super(Start()){
    on<click>(_onSignUpClick);
  }






  Future<void> _onSignUpClick(click event , Emitter<AppState> emit)async{
    emit( Loading(model: null));
    var response = await AuthenticationRepository.signUp();
    if(response.httpStatusCode == 200 || response.httpStatusCode == 201){
      emit( Done(model:response));
    }else{
      emit( ErrorLoading(model: response,message: response.message));
    }

  }




}

SignUpBloc signUpBloc = new SignUpBloc();


