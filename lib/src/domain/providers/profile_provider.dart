import '../../Base/common/file_export.dart';

class ProfileProvider extends ChangeNotifier {
  bool? profile_status = false;
  changeProfileStatus({bool? status}) {
    profile_status = status!;
    notifyListeners();
  }
}