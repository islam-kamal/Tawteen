import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/repositories/NafathRepo/nafath_repository.dart';
import 'package:code/src/domain/entities/nafath_info_entity.dart';

class NafathBloc extends Bloc<AppEvent,AppState>{
  Timer? timer;
  NafathBloc():super(Start()){
    on<SendNafathRequestEvent>(_onSendNafathRequestActionFun);
    on<CheckNafathStatusEvent>(_onCheckNafathStatusFun);
    on<ApplicantCheckExistEvent>(_onApplicantCheckExistFun);
    on<GetApplicantDataEvent>(_onGetApplicantDataFun);
  }


  Future<void> _onSendNafathRequestActionFun(
      SendNafathRequestEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      print(" 1");
      var sendNafathRequestResponse = await nafath_repository.sendNafathRequest(
        nationalId: event.nationalId
      );
      print(" 2");
      if (sendNafathRequestResponse!.random != null) {
        print(" 3");
        emit(SendNafthRequestDone(model: sendNafathRequestResponse ,
            indicator: "sendNafathRequestResponse",nationalId: event.nationalId));
               print(" 4");
      } else {
        print(" 5");
        emit(ErrorLoading(model: sendNafathRequestResponse,indicator: "sendNafathRequestResponse"));
      }
    } catch (e) {
      print("sendNafathRequest 6");
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
      emit(Loading());
        var nafathCheckStatusResponse = await nafath_repository.nafathCheckStatus(
            nationalId: event.nationalId,
            transId: event.transId.toString(),
            random: event.random.toString()
        );
        print("nafathCheckStatusResponse!.status : ${nafathCheckStatusResponse!.status}");
        if(nafathCheckStatusResponse.status ==  "COMPLETED"){

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
          print("5");
          timer!.cancel();
        nafath_bloc.add(ApplicantCheckExistEvent(
          nationalId: event.nationalId
        ));

        }
        else if(nafathCheckStatusResponse.status ==  "WAITING"){
          print("WAITING 1");
          timer = Timer.periodic(Duration(seconds: 10), (Timer t) async {
            Shared.dismissDialog(context: navigatorKey.currentContext!);
            nafath_bloc.add(CheckNafathStatusEvent(
                nationalId: event.nationalId,
                random: event.random!.toString(),
                transId: event.transId!.toString(),
            ));
          });

          print("WAITING 2");
        }
        else if(nafathCheckStatusResponse.status ==  "EXPIRED"){
          print("EXPIRED 1");
          timer!.cancel();
      //    Shared.dismissDialog(context: navigatorKey.currentContext!);
      /*    nafath_bloc.add(SendNafathRequestEvent(
              nationalId: event.nationalId
          ));*/
          emit(ErrorLoading(model: nafathCheckStatusResponse));
          print("EXPIRED 2");
        } else{
          emit(ErrorLoading(model: nafathCheckStatusResponse));
        }


    } catch (e) {
      timer!.cancel();
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
        nafath_bloc.add(GetApplicantDataEvent(
          nationalId: event.nationalId
        ));
      }else{
        emit(ErrorLoading(model: checkApplicantExistResponse));
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
      if(getApplicantDataResponse.httpStatusCode == 200){

        emit(Done(model: getApplicantDataResponse));
      }else{
        emit(ErrorLoading(model: getApplicantDataResponse));
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