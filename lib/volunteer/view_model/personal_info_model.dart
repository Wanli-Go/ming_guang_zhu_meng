import 'package:ming_guang/volunteer/model/model_personal_info.dart';
import 'package:ming_guang/volunteer/services/personal_service.dart';
PersonalInfo? _info;
class PersonalInfoViewModel {
  final PersonalInfoService service = PersonalInfoService();

  PersonalInfoViewModel();

  Future<PersonalInfo> getPersonalInfo() async {
    return _info ??= await service.fetchPersonalInfo();
  }
  void saveInfo(PersonalInfo newInfo){
    _info = newInfo;
  }
}
