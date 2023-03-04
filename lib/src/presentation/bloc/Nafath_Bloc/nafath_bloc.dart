import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/repositories/NafathRepo/nafath_repository.dart';
import 'package:code/src/domain/entities/nafath_info_entity.dart';
import 'package:code/src/domain/entities/user_entity.dart';

class NafathBloc extends Bloc<AppEvent,AppState>{
  Timer? timer;
  int _start = 0;
  NafathBloc():super(Start()){
    on<SendNafathRequestEvent>(_onSendNafathRequestActionFun);
    on<CheckNafathStatusEvent>(_onCheckNafathStatusFun);
    on<ApplicantCheckExistEvent>(_onApplicantCheckExistFun);
    on<GetApplicantDataEvent>(_onGetApplicantDataFun);
    on<loginClickEvent> (_onSigninFun);
  }


  Future<void> _onSendNafathRequestActionFun(
      SendNafathRequestEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var sendNafathRequestResponse = await nafath_repository.sendNafathRequest(
        nationalId: event.nationalId
      );
      if (sendNafathRequestResponse!.random != null) {
        emit(SendNafthRequestDone(model: sendNafathRequestResponse ,
            indicator: "sendNafathRequestResponse",nationalId: event.nationalId));
      } else {
        emit(ErrorSendNafthRequest(model: sendNafathRequestResponse,
            message: "invalid data"));
      }
    } catch (e) {
      emit(
        ErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }

  Future<void> _onCheckNafathStatusFun(
      CheckNafathStatusEvent event, Emitter<AppState> emit) async {
    try {
      print("11");
      emit(Loading());
      print("22");
        var nafathCheckStatusResponse = await nafath_repository.nafathCheckStatus(
            nationalId: event.nationalId,
            transId: event.transId.toString(),
            random: event.random.toString()
        );
      print("33");
        print("nafathCheckStatusResponse!.status : ${nafathCheckStatusResponse!.status}");
        if(nafathCheckStatusResponse.status ==  "COMPLETED"){
          print("44");
          sharedPreferenceManager.writeData(CachingKey.NATIONALITY_ID, nafathCheckStatusResponse.id);
          sharedPreferenceManager.writeData(CachingKey.ArFullName, nafathCheckStatusResponse.arFullName);
          sharedPreferenceManager.writeData(CachingKey.EnFullName, nafathCheckStatusResponse.enFullName);
          sharedPreferenceManager.writeData(CachingKey.ArFirst, nafathCheckStatusResponse.arFirst);
          sharedPreferenceManager.writeData(CachingKey.ArFather, nafathCheckStatusResponse.arFather);
          sharedPreferenceManager.writeData(CachingKey.ArFamily, nafathCheckStatusResponse.arFamily);
          sharedPreferenceManager.writeData(CachingKey.ArGrand, nafathCheckStatusResponse.arGrand);
          sharedPreferenceManager.writeData(CachingKey.Gender, nafathCheckStatusResponse.gender);
          sharedPreferenceManager.writeData(CachingKey.status, nafathCheckStatusResponse.status);
          sharedPreferenceManager.writeData(CachingKey.DobG, nafathCheckStatusResponse.dobG);
          sharedPreferenceManager.writeData(CachingKey.DobH, nafathCheckStatusResponse.dobH);
          sharedPreferenceManager.writeData(CachingKey.EnFirst, nafathCheckStatusResponse.enFirst);
          sharedPreferenceManager.writeData(CachingKey.EnFather, nafathCheckStatusResponse.enFather);
          sharedPreferenceManager.writeData(CachingKey.EnFamily, nafathCheckStatusResponse.enFamily);
          sharedPreferenceManager.writeData(CachingKey.EnGrand, nafathCheckStatusResponse.enGrand);
          sharedPreferenceManager.writeData(CachingKey.IdExpiryDateH, nafathCheckStatusResponse.idExpiryDateH);
          sharedPreferenceManager.writeData(CachingKey.IdExpiryDateG, nafathCheckStatusResponse.idExpiryDateG);
          sharedPreferenceManager.writeData(CachingKey.EnTwoNames, nafathCheckStatusResponse.enTwoNames);
          sharedPreferenceManager.writeData(CachingKey.ArTwoNames, nafathCheckStatusResponse.arTwoNames);
          sharedPreferenceManager.writeData(CachingKey.Nationality, nafathCheckStatusResponse.nationality);
          sharedPreferenceManager.writeData(CachingKey.ArNationality, nafathCheckStatusResponse.arNationality);
          sharedPreferenceManager.writeData(CachingKey.EnNationality, nafathCheckStatusResponse.enNationality);
          print("55");
          timer!.cancel();
          print("66");
          emit(NafathCheckStatusDone(
              model: nafathCheckStatusResponse,
              nationalId: nafathCheckStatusResponse.id.toString())
          );
          print("77");
        }
        else if(nafathCheckStatusResponse.status ==  "WAITING"){
          print("WAITING 1");
          print("88");
          const oneSec = const Duration(seconds: 10);
          timer = new Timer.periodic(
              oneSec,
                  (Timer timer) {
                    if (_start > 30) {
                      timer.cancel();
                      print("%%%%%%%%%%%%%%% timer stopped %%%%%%%%%%%%%%%");
                     Future.delayed(Duration(seconds: 2),
                     ()async{
                       emit(ErrorNafathCheckStatus(model: nafathCheckStatusResponse));
                     });
                    } else {
                      _start = _start + 10;
                      Shared.dismissDialog(context: navigatorKey.currentContext!);
                      nafath_bloc.add(CheckNafathStatusEvent(
                        nationalId: event.nationalId,
                        random: event.random!.toString(),
                        transId: event.transId!.toString(),
                      ));
                    }
              });
  /*        timer = Timer.periodic(Duration(seconds: 10), (Timer t) async {
            Shared.dismissDialog(context: navigatorKey.currentContext!);
            nafath_bloc.add(CheckNafathStatusEvent(
                nationalId: event.nationalId,
                random: event.random!.toString(),
                transId: event.transId!.toString(),
            ));
          });*/
          print("99");
          print("WAITING 2");
        }
        else if(nafathCheckStatusResponse.status ==  "EXPIRED"){
          print("EXPIRED 1");
          print("---10");
      //    timer!.cancel();
      //    Shared.dismissDialog(context: navigatorKey.currentContext!);
      /*    nafath_bloc.add(SendNafathRequestEvent(
              nationalId: event.nationalId
          ));*/
          print("---11");
          emit(ErrorNafathCheckStatus(model: nafathCheckStatusResponse));
          print("EXPIRED 2");

        } else{

          print("---12");
          emit(ErrorNafathCheckStatus(model: nafathCheckStatusResponse,));
        }


    } catch (e) {
  //    timer!.cancel();
      print("---13");
      print("e : ${e.toString()}");
      emit(
        ErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }

  Future<void> _onApplicantCheckExistFun(
      ApplicantCheckExistEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var checkApplicantExistResponse = await nafath_repository.checkApplicantExist(
        nationalId: event.nationalId,
      );
      print("checkApplicantExistResponse : ${checkApplicantExistResponse!..toJson()}");
      if(checkApplicantExistResponse.data == 1){
        emit(CheckApplicantExistDone(model: checkApplicantExistResponse,indicator: checkApplicantExistResponse.data.toString()));
      }else{
        emit(ErrorCheckApplicantExist(model: checkApplicantExistResponse,message: checkApplicantExistResponse.message));
      }
    } catch (e) {
      emit(
        ErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }

  Future<void> _onGetApplicantDataFun(
      GetApplicantDataEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var getApplicantDataResponse = await nafath_repository.getApplicantData(
        nationalId: event.nationalId,
      );
      print("getApplicantDataResponse : ${getApplicantDataResponse!.toJson()}");
      if(getApplicantDataResponse.httpStatusCode == 200 || getApplicantDataResponse.httpStatusCode == 201){
        sharedPreferenceManager.writeData(CachingKey.EMAIL, getApplicantDataResponse.data!.email);
        emit(GetApplicantDataDone(model: getApplicantDataResponse));
      }else{
        emit(ErrorGetApplicantData(model: getApplicantDataResponse,message: getApplicantDataResponse.message));
      }
    } catch (e) {
      emit(
        ErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }

  Future<void> _onSigninFun(
      loginClickEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var siginResponse = await nafath_repository.signIn();
      print("siginResponse : ${siginResponse!.toJson()}");
      if(siginResponse.succeeded! ){
        sharedPreferenceManager.writeData(CachingKey.EMAIL, siginResponse.data!.email);
        sharedPreferenceManager.writeData(CachingKey.AUTH_TOKEN, siginResponse.data!.jwToken);
        sharedPreferenceManager.writeData(CachingKey.APPLICANT_ID, siginResponse.data!.applicationId);
        sharedPreferenceManager.writeData(CachingKey.AUTH_TOKEN, siginResponse.data!.jwToken);
        Shared.nafathInfoEntity = new NafathInfoEntity(
          id: await sharedPreferenceManager.readInt(CachingKey.NATIONALITY_ID),
          arFirst: await sharedPreferenceManager.readString(CachingKey.ArFirst),
          arFather: await sharedPreferenceManager.readString(CachingKey.ArFather),
          enFirst: await sharedPreferenceManager.readString(CachingKey.EnFirst),
          enFather: await sharedPreferenceManager.readString(CachingKey.EnFather),
          gender: await sharedPreferenceManager.readString(CachingKey.Gender),
          dobG: await sharedPreferenceManager.readString(CachingKey.DobG),
          email: await sharedPreferenceManager.readString(CachingKey.EMAIL),
          city_id: await sharedPreferenceManager.readString(CachingKey.CITY_ID),
          city_name_ar: await sharedPreferenceManager.readString(CachingKey.CITY_NAME_AR),
          city_name_en: await sharedPreferenceManager.readString(CachingKey.CITY_NAME_En),
           phone:  await sharedPreferenceManager.readString(CachingKey.MOBILE_NUMBER),
        );
        emit(SiginDone(model: siginResponse));
      }else{
        emit(ErrorSigin(model: siginResponse,message: siginResponse.message));
      }
    } catch (e) {
      emit(
        ErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }
}

final nafath_bloc = NafathBloc();