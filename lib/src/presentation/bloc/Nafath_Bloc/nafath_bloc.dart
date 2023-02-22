import 'package:code/src/Base/common/file_export.dart';
import 'package:code/src/data/repositories/NafathRepo/nafath_repository.dart';

class NafathBloc extends Bloc<AppEvent,AppState>{
  NafathBloc():super(Start()){
    on<NafathActionEvent>(_onNafathActionFun);

  }


  Future<void> _onNafathActionFun(
      NafathActionEvent event, Emitter<AppState> emit) async {
    try {
      emit(Loading());
      print("1");
      var sendNafathRequestResponse = await nafath_repository.sendNafathRequest(
        nationalId: event.nationalId
      );
      print("2");
      if (sendNafathRequestResponse!.random != null) {
        print("3");
        var nafathCheckStatusResponse = await nafath_repository.nafathCheckStatus(
            nationalId: event.nationalId,
          transId: sendNafathRequestResponse.transId.toString(),
          random: sendNafathRequestResponse.random.toString()
        );
        print("4");
        if(nafathCheckStatusResponse!.id != event.nationalId){
          print("5");
          var checkApplicantExistResponse = await nafath_repository.checkApplicantExist(
              nationalId: event.nationalId,
          );
          print("6");
          if(checkApplicantExistResponse!.data == 1){
            print("7");
            var getApplicantDataResponse = await nafath_repository.getApplicantData(
              nationalId: event.nationalId,
            );
            print("8");
            if(getApplicantDataResponse!.httpStatusCode == 200){
              print("9");
              emit(Done(model: getApplicantDataResponse));
            }else{
              print("10");
              emit(ErrorLoading(model: getApplicantDataResponse));
            }
          }else{
            print("11");
            emit(ErrorLoading(model: checkApplicantExistResponse));
          }

        }else{
          print("12");
          emit(ErrorLoading(model: nafathCheckStatusResponse));
        }

      }
      else {
        print("13");
        emit(ErrorLoading(model: sendNafathRequestResponse));
      }
    } catch (e) {
      print("14");
      emit(
        ErrorLoading(
          message: "Failed to fetch data. Is your device online ?",
        ),
      );
    }
  }
}

final nafath_bloc = NafathBloc();