import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/repositories/NafathRepo/nafath_repository.dart';
import 'package:code/src/domain/entities/nafath_info_entity.dart';
import 'package:code/src/domain/entities/user_entity.dart';

class NafathBloc extends Bloc<AppEvent,AppState>{
  Timer? timer;

  NafathBloc():super(Start()){
    on<SendNafathRequestEvent>(_onSendNafathRequestActionFun);
    on<CheckNafathStatusEvent>(_onCheckNafathStatusFun);
    on<ApplicantCheckExistEvent>(_onApplicantCheckExistFun);
    on<GetApplicantDataEvent>(_onGetApplicantDataFun);
    on<loginClickEvent> (_onSigninFun);
    on<ExpireWaitNafathStatusEvent>(_onExpireWaitFun);
  }


  Future<void> _onSendNafathRequestActionFun( SendNafathRequestEvent event, Emitter<AppState> emit) async {
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

  Future<void> _onCheckNafathStatusFun(  CheckNafathStatusEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
        var nafathCheckStatusResponse = await nafath_repository.nafathCheckStatus(
            nationalId: event.nationalId,
            transId: event.transId.toString(),
            random: event.random.toString()
        );

        if(nafathCheckStatusResponse!.status ==  "COMPLETED"){
          sharedPreferenceManager.writeData(CachingKey.NATIONALITY_ID, nafathCheckStatusResponse.person!.id);
          sharedPreferenceManager.writeData(CachingKey.ArFullName, nafathCheckStatusResponse.person!.arFullName);
          sharedPreferenceManager.writeData(CachingKey.EnFullName, nafathCheckStatusResponse.person!.enFullName);
          sharedPreferenceManager.writeData(CachingKey.ArFirst, nafathCheckStatusResponse.person!.arFirst);
          sharedPreferenceManager.writeData(CachingKey.ArFather, nafathCheckStatusResponse.person!.arFather);
          sharedPreferenceManager.writeData(CachingKey.ArFamily, nafathCheckStatusResponse.person!.arFamily);
          sharedPreferenceManager.writeData(CachingKey.ArGrand, nafathCheckStatusResponse.person!.arGrand);
          sharedPreferenceManager.writeData(CachingKey.Gender, nafathCheckStatusResponse.person!.gender);
          sharedPreferenceManager.writeData(CachingKey.DobG, nafathCheckStatusResponse.person!.dobG);
          sharedPreferenceManager.writeData(CachingKey.DobH, nafathCheckStatusResponse.person!.dobH);
          sharedPreferenceManager.writeData(CachingKey.EnFirst, nafathCheckStatusResponse.person!.enFirst);
          sharedPreferenceManager.writeData(CachingKey.EnFather, nafathCheckStatusResponse.person!.enFather);
          sharedPreferenceManager.writeData(CachingKey.EnFamily, nafathCheckStatusResponse.person!.enFamily);
          sharedPreferenceManager.writeData(CachingKey.EnGrand, nafathCheckStatusResponse.person!.enGrand);
          sharedPreferenceManager.writeData(CachingKey.IdExpiryDateH, nafathCheckStatusResponse.person!.idExpiryDateH);
          sharedPreferenceManager.writeData(CachingKey.IdExpiryDateG, nafathCheckStatusResponse.person!.idExpiryDateG);
          sharedPreferenceManager.writeData(CachingKey.Nationality, nafathCheckStatusResponse.person!.nationality);
          sharedPreferenceManager.writeData(CachingKey.ArNationality, nafathCheckStatusResponse.person!.arNationality);
          sharedPreferenceManager.writeData(CachingKey.EnNationality, nafathCheckStatusResponse.person!.enNationality);
          if(timer != null){
            timer!.cancel();
          }
          emit(NafathCheckStatusDone(
              model: nafathCheckStatusResponse,
              nationalId: nafathCheckStatusResponse.person!.id.toString())
          );
        }
        else if(nafathCheckStatusResponse.status ==  "WAITING"){
          const oneSec = const Duration(seconds: 10);
          timer = new Timer.periodic(
              oneSec,
                  (Timer timer) {
                    if (Shared.start_timer > 60  ) {
                      timer.cancel();
                    }else if(Shared.start_timer == 60){
                      timer.cancel();
                      Shared.dismissDialog(context: navigatorKey.currentContext!);
                      Shared.start_timer = Shared.start_timer + 10;
                  } else{
                      Shared.start_timer = Shared.start_timer + 10;
                      if(nafathCheckStatusResponse.status ==  "COMPLETED"
                          || nafathCheckStatusResponse.status ==  "EXPIRED"){
                      }else{
                        Shared.dismissDialog(context: navigatorKey.currentContext!);
                        nafath_bloc.add(CheckNafathStatusEvent(
                          nationalId: event.nationalId,
                          random: event.random!.toString(),
                          transId: event.transId!.toString(),
                        ));
                      }

                    }
              });

        }
        else if(nafathCheckStatusResponse.status ==  "EXPIRED"){
        timer!.cancel();
          emit(ErrorNafathCheckStatus(model: nafathCheckStatusResponse));

        } else{
          emit(ErrorNafathCheckStatus(model: nafathCheckStatusResponse,));
        }


    } catch (e) {
      emit(
        ErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }

  Future<void> _onApplicantCheckExistFun(   ApplicantCheckExistEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var checkApplicantExistResponse = await nafath_repository.checkApplicantExist(
        nationalId: event.nationalId,
      );
      if(checkApplicantExistResponse!.succeeded! ){
        emit(CheckApplicantExistDone(model: checkApplicantExistResponse,
            indicator: checkApplicantExistResponse.data.toString()));
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

  Future<void> _onGetApplicantDataFun(   GetApplicantDataEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var getApplicantDataResponse = await nafath_repository.getApplicantData(
        nationalId: event.nationalId,
      );
      if(getApplicantDataResponse!.httpStatusCode == 200 || getApplicantDataResponse.httpStatusCode == 201){
        sharedPreferenceManager.writeData(CachingKey.EMAIL, getApplicantDataResponse.applicant_data!.email);
        sharedPreferenceManager.writeData(CachingKey.MOBILE_NUMBER, getApplicantDataResponse.applicant_data!.phone);
        sharedPreferenceManager.writeData(CachingKey.CITY_NAME_En, getApplicantDataResponse.applicant_data!.cityName);
        sharedPreferenceManager.writeData(CachingKey.CITY_NAME_AR, getApplicantDataResponse.applicant_data!.cityName);
        sharedPreferenceManager.writeData(CachingKey.CITY_ID, getApplicantDataResponse.applicant_data!.cityId);
        sharedPreferenceManager.writeData(CachingKey.SUGGESTED_JIBS_CITY_ID, getApplicantDataResponse.applicant_data!.cityId);
        sharedPreferenceManager.writeData(CachingKey.SUGGESTED_JIBS_JOB_TITLE_ID, getApplicantDataResponse.applicant_data!.jobTitleId);
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

  Future<void> _onSigninFun( loginClickEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      var siginResponse = await nafath_repository.signIn();
      print("siginResponse : ${siginResponse!.toJson()}");
      if(siginResponse!.succeeded! ){

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
          phone:  await sharedPreferenceManager.readString(CachingKey.MOBILE_NUMBER),
          arFamily:  await sharedPreferenceManager.readString(CachingKey.ArFamily),
          enFamily: await sharedPreferenceManager.readString(CachingKey.EnFamily),
          arGrand:  await sharedPreferenceManager.readString(CachingKey.ArGrand),
          enGrand: await sharedPreferenceManager.readString(CachingKey.EnGrand),
          status: await sharedPreferenceManager.readString(CachingKey.status),
          arFullName: await sharedPreferenceManager.readString(CachingKey.ArFullName),
          enFullName: await sharedPreferenceManager.readString(CachingKey.EnFullName),
          dobH: await sharedPreferenceManager.readInt(CachingKey.DobH),
          nationality: await sharedPreferenceManager.readInt(CachingKey.Nationality),
          enTwoNames: await sharedPreferenceManager.readString(CachingKey.EnTwoNames),
          arTwoNames: await sharedPreferenceManager.readString(CachingKey.ArTwoNames),
          enNationality: await sharedPreferenceManager.readString(CachingKey.EnNationality),
          arNationality: await sharedPreferenceManager.readString(CachingKey.ArNationality),
          city_id:  await sharedPreferenceManager.readInt(CachingKey.CITY_ID),
          city_name_ar:  await sharedPreferenceManager.readString(CachingKey.CITY_NAME_AR),
          city_name_en:  await sharedPreferenceManager.readString(CachingKey.CITY_NAME_En),
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

  Future<void> _onExpireWaitFun(  ExpireWaitNafathStatusEvent event, Emitter<AppState> emit) async {
    try {
      emit(EmptyField());

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