import 'dart:io';

import 'package:talkam/src/core/utils/app_utils_exports.dart';
import 'package:talkam/src/domain/models/login_response/profile.dart';
import 'package:talkam/src/features/case_management/model/report_abuse_model/report_abuse_model.dart';

import '../../features/courses/model/search_filter_model.dart';

abstract class UserRepository {
  void saveToken(String val);
  String getToken();
  CurrentState getCurrentState();
  void saveCurrentState(CurrentState val);
  bool hasClearedCache();
  void saveCacheStatus(bool status);
  void saveProfile(Profile profile);
  void setCurrentProfile(Profile profile);
  Profile getProfile();
  void saveReportAbuse(ReportAbuseModel reportAbuse);
  ReportAbuseModel getReportedAbuse();
  void saveReportFiles(List<File?> reportAbuse);
  List<File?> getReportFiles();
  List<ReportAbuseModel> getReport();
  void saveReport(List<ReportAbuseModel> reportAbuse);
  void setSearchFilter(SearchFilterModel? searchFilterModel);
  SearchFilterModel? getSearchFilter();
}
