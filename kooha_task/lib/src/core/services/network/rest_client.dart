import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:kooha_task/src/core/services/config/response/base_response.dart';
import 'package:kooha_task/src/domain/models/login_response/login_response.dart';
import 'package:kooha_task/src/domain/models/login_response/profile.dart';
import 'package:kooha_task/src/features/auth/model/forgot_password/forgot_password.dart';
import 'package:kooha_task/src/features/auth/model/forgot_password/reset_password.dart';
import 'package:kooha_task/src/features/auth/model/login/login_model.dart';
import 'package:kooha_task/src/features/auth/model/sign_up/resend_otp_model.dart';
import 'package:kooha_task/src/features/auth/model/sign_up/sign_up_model.dart';
import 'package:kooha_task/src/features/auth/model/sign_up/verify_acc_model.dart';
import 'package:kooha_task/src/features/case_management/model/case_response/case_response.dart';
import 'package:kooha_task/src/features/case_management/model/query_filters.dart';
import 'package:kooha_task/src/features/case_management/model/report_abuse_model/report_abuse_model.dart';
import 'package:kooha_task/src/features/directories/model/directory_response_model/directory_response.dart';
import 'package:kooha_task/src/features/home/model/ad_model/ad_model.dart';
import 'package:kooha_task/src/features/supporters/model/supporter_response_model/supporter_response.dart';
import 'package:kooha_task/src/features/profile/model/delete_model.dart';
import 'package:kooha_task/src/features/profile/model/edit_profile_model.dart';
import 'package:kooha_task/src/features/profile/model/upload_file_response.dart';
import 'package:kooha_task/src/features/profile/presentation/model/change_pass_model.dart';
import 'package:kooha_task/src/features/talk/model/flag_post.dart';
import 'package:kooha_task/src/features/talk/model/talk_users_model/talk_user_response.dart';
import '../../../features/case_management/model/case_response/case_countries_resp.dart';
import '../../../features/case_management/model/case_response/stat_chart_response/stat_chart_response.dart';
import '../../../features/courses/model/assessment_report_response.dart';
import '../../../features/courses/model/course_content_response.dart';
import '../../../features/courses/model/course_description_response.dart';
import '../../../features/courses/model/course_module_content_response.dart';
import '../../../features/courses/model/course_module_response.dart';
import '../../../features/courses/model/course_navigator.dart';
import '../../../features/courses/model/course_response.dart';
import '../../../features/courses/model/enrolled_course_response.dart';
import '../../../features/courses/model/generate_certificate_response.dart';
import '../../../features/courses/model/quiz_response.dart';
import '../../../features/courses/model/submit_action_report.dart';
import '../../../features/courses/model/submit_assessment.dart';
import '../../../features/media/model/add_post/add_post_model.dart';
import '../../../features/media/model/edit_post/edit_post_model.dart';
import '../../../features/media/model/media_query_filters.dart';
import '../../../features/media/model/media_response.dart';
import '../../../features/media/model/my_post_model/my_post_response.dart';
import '../../../features/media/model/single_post_model/single_post_response.dart';
import '../../../features/talk/model/comment_model.dart';
import '../../../features/talk/model/create_talk_model/create_talk_model.dart';
import '../../../features/talk/model/single_post_talk/single_post_talk.dart';
import '../../../features/talk/model/talk_response/talk_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/auth/login')
  Future<BaseResponse<LoginResponse>> login(@Body() LoginModel loginModel);

  @POST('/auth/sign-up')
  Future<BaseResponse> signUp(@Body() SignUpModel signUpModel);

  @POST('/auth/verify-email')
  Future<BaseResponse> verifyAccount(@Body() VerifyAccModel verifyAccModel);

  @POST('/auth/verify-email/resend-code')
  Future<BaseResponse> verifyAccountResend(
      @Body() ResendOTPModel resendOTPModel);

  @PATCH('/auth/forgot-password')
  Future<BaseResponse> forgotPassword(@Body() ForgotPassModel forgotPassModel);

  @POST('/auth/validate-reset-password-token')
  Future<BaseResponse> resetPassowdOTP(@Body() VerifyAccModel verifyAccModel);

  @PATCH('/auth/reset-password')
  Future<BaseResponse> resetPassword(
      @Body() ResetPasswordModel resetPasswordModel);

  @GET('/directories')
  Future<BaseResponse<List<DirectoryResponseModel>>> getDirectoriesPreview(
    @Queries() FilterParams? filterQuery,
  );

  @GET('/supporters')
  Future<BaseResponse<List<SupporterResponse>>> getSupportes(
    @Queries() FilterParams? filterQuery,
  );

  @PATCH('/users/me')
  Future<BaseResponse> editProfile(@Body() EditProfileModel editProfileModel);

  @PATCH('/users/me')
  //? model has a device id parameter to send to
  Future<BaseResponse> updateDeviceNotificationToken(
      @Body() Map<String, dynamic> deviceId);

  @DELETE('/users/me')
  Future<BaseResponse> deletAcc(@Body() DeleteModel deleteModel);

  @GET('/users/me')
  Future<BaseResponse<Profile>> getProfile();

  @PATCH('/users/change-password')
  Future<BaseResponse> changePassword(@Body() ChangePassModel changePassModel);

  @POST('/files')
  @MultiPart()
  Future<UploadFileResponse> uploadFiles(@Part() File file);

  @GET('/cases')
  Future<BaseResponse<List<CaseResponse>>> getAllCases(
      @Queries() FilterParams? filters);

  @GET('/cases/gender-age-stats')
  Future<BaseResponse<StatChartResponse>> getChart(
      @Queries() FilterParams? filters);

  @GET('/cases/country-stats')
  Future<BaseResponse<CaseCountriesResp>> getCaseCountry(
      @Queries() FilterParams? filters);

  @POST('/cases')
  Future<BaseResponse> reportAbuse(@Body() ReportAbuseModel reportAbuseModel);

  ///Media
  @GET('/media/posts')
  Future<BaseResponse<List<MediaResponse>>> getMedia(
      @Queries() MediaFilterParams? filters);

  @GET('/media/posts/me?mine=true')
  Future<BaseResponse<List<MyPostResponse>>> getMyPost(
      @Queries() MediaFilterParams? filters);

  @GET('/media/posts/{id}')
  Future<BaseResponse<SinglePostResponse>> getSinglePost(
      {@Path('id') String? id});

  @POST('/media/posts')
  Future<BaseResponse> addPost(@Body() AddPostModel addPostModel);

  @PATCH('/media/posts/')
  Future<BaseResponse> editPost(@Body() EditPostModel editPostModel,
      {String? id});

  @PATCH('/media/posts/share')
  Future<BaseResponse> sharePost({String? id});

  @DELETE('/media/posts/')
  Future<BaseResponse> deletePost({String? id});

  @GET('/courses?status=published')
  Future<BaseResponse<List<CourseResponse>>> getAllCourses(
    @Query('pageNo') int pageNo,
    @Query('language') String language,
    @Query('category') String category,
    @Queries() FilterParams? filters,
  );

  @GET('/courses/me')
  Future<EnrolledCourseResponse> getEndrolledCourses(
      @Query('pageNo') int pageNo, @Queries() FilterParams? filters);

  @GET('/courses/{id}')
  Future<CourseDescriptionResponse> getCourseDescription(
      @Path('id') String courseId);

  @GET('/courses/modules')
  Future<CourseModuleResponse> getCourseModule(
      @Query('course_id') String courseId, @Query('limitNo') int limitNo);

  @GET('/courses/modules/lessons')
  Future<CourseModuleContentResponse> getCourseModuleContent(
      @Query('course_id') String courseId,
      @Query('module_id') String moduleId,
      @Query('limitNo') int limitNo);

  @GET('/courses/modules/lessons/navigate')
  Future<CourseNavigatorResponse> getCourseNavigator(
      @Query('course_id') String courseId, @Query('lesson_id') String lessonId);

  @GET('/courses/modules/lessons/{id}')
  Future<CourseContentResponse> getCourseLesson(@Path('id') String courseId);

  @GET('/courses/quiz')
  Future<QuizResponse> getAllQuiz(@Query('course_id') String courseId);

  @POST('/courses/enrolments')
  Future<BaseResponse> enrollInCourse(@Body() Map<String, dynamic> body);

  @GET('/courses/{id}/generate-certificate')
  Future<GenerateCertificateResponse> generateCertificate(
      @Path('id') String courseId);

  @GET('/courses/quiz/report')
  Future<AssessmentReportResponse> getAssessmentReport(
      @Query('course_id') String courseId);

  @POST('/courses/quiz/submit')
  Future<BaseResponse> submitAssessment(
      @Body() SubmitAssessment submitAssessment);

  @PATCH('/courses/enrolments/confirm-pledge')
  Future<BaseResponse> confirmPledge(@Body() Map<String, dynamic> body);

  @POST('/courses/pledges')
  Future<BaseResponse> submitActionReport(
      @Body() SubmitActionReport submitActionReport);

  @GET('/talk/posts')
  Future<BaseResponse<List<TalkResponse>>> getAllTalk(
      @Queries() FilterParams? filters);

  @GET('/users/{id}')
  Future<BaseResponse<Profile>> getUserProfile(@Path('id') String userId);

  @GET('/talk/posts')
  Future<BaseResponse<List<TalkResponse>>> myPost(
    @Queries() FilterParams? filters,
    @Query('user_id') String? userId,
  );

  @GET('/supporters')
  Future<BaseResponse<List<AdModel>>> adList(
    @Query('ads') bool? hasAd,
    @Query('limitNo') int? userId,
  );

  @GET('/talk/posts/{id}')
  Future<BaseResponse<SinglePostTalk>> singleTalkPost(
      @Path('id') String postId);

//!Here
  @GET('/users')
  Future<BaseResponse<List<TalkUsersResponse>>> getTalkUsers(
    @Queries() FilterParams? filters,
    @Query('talk_users') bool? talkUser,
  );

  @PATCH('/talk/posts/{id}/flag')
  Future<BaseResponse<SinglePostTalk>> flagTalkPost(
      @Path('id') String postId, @Body() FlagPost flagPost);

  @DELETE('/talk/posts/{id}')
  Future<BaseResponse> deleteTalkPost(@Path('id') String postId);

  @DELETE('/talk/posts/{id}/comment')
  Future<BaseResponse> deleteTalkComment(
      @Path('id') String postId, @Query('comment_id') String commentId);

  @POST('/talk/posts/{id}/comment')
  Future<BaseResponse> comment(
      @Path('id') String postId, @Body() CommentModel commentModel);

  @PATCH('/talk/posts/{id}/share')
  Future<BaseResponse> shareTalk(@Path('id') String postId);

  @PATCH('/talk/posts/{id}/like')
  Future<BaseResponse> likeComment(
      @Path('id') String postId,
      @Query('for') String postORComment,
      @Query('comment_id') String? commentId);

  @POST('/talk/posts')
  Future<BaseResponse> createTalkPost(@Body() CreateTalkModel createTalkModel);
}
