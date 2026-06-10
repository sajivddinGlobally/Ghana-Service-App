import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CForgotPassBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CForgotPassResModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CGetMyPlanRequestModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CGetPlanModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CLoginBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CProfileModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CRegisterBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CRegisterResModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CUpdateProfileBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CUpdateProfileResModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CVerifyOrCreatePassBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CVerifyOrCreatePassResModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CloginResModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/clientCreateTicketBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/clientCreateTicketResModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/clientGetTicketModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/clientNotificationModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/createPlanReqiestBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/createPlanRequestResModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/createServiceRequestBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/createServiceRequestResModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getMyPlanRequestServiceModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getPlanServiceDetailsModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getPlanServiceListModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getServiceRequestModel.dart';
import 'package:dwelleasy_ghana/data/model/acceptRequestBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/acceptRequestResModel.dart';
import 'package:dwelleasy_ghana/data/model/createLeaveRequestBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/createLeaveRequestResModel.dart';
import 'package:dwelleasy_ghana/data/model/createTicketBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/createTicketResModel.dart';
import 'package:dwelleasy_ghana/data/model/forgotPasswordBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/forgotPasswordResModel.dart';
import 'package:dwelleasy_ghana/data/model/getAssignCountModel.dart';
import 'package:dwelleasy_ghana/data/model/getAssigneRequestModel.dart';
import 'package:dwelleasy_ghana/data/model/getCompleteRequestModel.dart';
import 'package:dwelleasy_ghana/data/model/getMyLeaveModel.dart';
import 'package:dwelleasy_ghana/data/model/getNotificationModel.dart';
import 'package:dwelleasy_ghana/data/model/getPendingRequestModel.dart';
import 'package:dwelleasy_ghana/data/model/getProfileModel.dart';
import 'package:dwelleasy_ghana/data/model/getServiceResModel.dart';
import 'package:dwelleasy_ghana/data/model/getTicketModel.dart';
import 'package:dwelleasy_ghana/data/model/loginBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/loginResModel.dart';
import 'package:dwelleasy_ghana/data/model/registerBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/registerResModel.dart';
import 'package:dwelleasy_ghana/data/model/requestCompleteBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/requestCompleteResModel.dart';
import 'package:dwelleasy_ghana/data/model/sendMessageBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/sendMessageResModel.dart';
import 'package:dwelleasy_ghana/data/model/todayAssignRequestModel.dart';
import 'package:dwelleasy_ghana/data/model/updateProfileBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/updateProfileResModel.dart';
import 'package:dwelleasy_ghana/data/model/uploadImageResModel.dart';
import 'package:dwelleasy_ghana/data/model/verifyOrCreatePasswordBody.dart';
import 'package:dwelleasy_ghana/data/model/verifyOrCreatePasswordRes.dart';
import 'package:retrofit/retrofit.dart';

import '../../data/model/addRatingRequestModel.dart';
import '../../data/model/getServiceRequestDetailsModel.dart';
import '../../data/model/serviceReminderResponseModel.dart';

part 'api.stateNetwork.g.dart';

// @RestApi(baseUrl: "http://192.168.1.43:4567")
// @RestApi(baseUrl: "https://qnr9g6df-4567.inc1.devtunnels.ms")
@RestApi(baseUrl: "https://dwell.themediaradar.com")
abstract class ApiStateNetwork {
  factory ApiStateNetwork(Dio dio, {String baseUrl}) = _ApiStateNetwork;

  @GET("/api/v1/employee/get-services")
  Future<GetServiceResModel> getAllService();

  @POST("/api/v1/employee/register")
  Future<RegisterResModel> employeeRegister(@Body() RegisterBodyModel body);

  @POST("/api/v1/employee/login")
  Future<LoginResModel> loginEmployee(@Body() LoginBodyModel body);

  @POST("/api/v1/employee/forgot-password")
  Future<ForgotPasswordResModel> forgotPassword(
    @Body() ForgotPasswordBodyModel body,
  );

  @POST("/api/v1/employee/forgot-password-verify")
  Future<VerifyOrCreatePasswordRes> verifyOrCreateNewPassword(
    @Body() VerifyOrCreatePasswordBody body,
  );

  @GET("/api/v1/employee/get-profile")
  Future<GetProfileModel> getProfile();

  @MultiPart()
  @POST("/api/v1/uploadImage")
  Future<UploadImageResModel> uploadImage(@Part(name: "file") File file);

  @PUT("/api/v1/employee/update-profile")
  Future<UpdateProfileResModel> updateProfile(
    @Body() UpdateProfileBodyModel body,
  );

  @POST("/api/v1/employee/create-leave-request")
  Future<CreateLeaveRquestResModel> createLeaveRequest(
    @Body() CreateLeaveRquestBodyModel body,
  );

  @GET("/api/v1/employee/get-my-leave-requests?page=1&limit=10")
  Future<GetMyLeaveModel> myLeaveRequest();

  @POST("/api/v1/employee/create-ticket")
  Future<CreateTicketResModel> createTicket(@Body() CreateTicketBodyModel body);

  @GET("/api/v1/employee/get-tickets?page=1&limit=10")
  Future<GetTicketModel> getTicket();

  @GET("/api/v1/employee/get-assign-count")
  Future<GetAssignCount> getAssignCount();

  @GET("/api/v1/employee/get-assigned-requests?page=1&limit=10")
  Future<GetAssignedRequestsModel> getAssignRequest();

  @GET("/api/v1/employee/get-pending-requests?page=1&limit=10")
  Future<GetPendingRequestsModel> getPendingRequest();

  @GET("/api/v1/employee/get-completed-requests?page=1&limit=10")
  Future<GetCompleteRequestsModel> getCompleteRequest();

  @POST("/api/v1/employee/accept-request")
  Future<AcceptRequestResModel> acceptRequest(
    @Body() AcceptRequestBodyModel body,
  );

  @POST("/api/v1/employee/send-message")
  Future<SendMessageResModel> sendMessage(@Body() SendMessageBodyModel body);

  @POST("/api/v1/employee/complete-request")
  Future<RequestCompleteResModel> requestComplete(
    @Body() RequestCompleteBodyModel body,
  );

  @GET("/api/v1/employee/get-assigned-requests?page=1&limit=10&today=true")
  Future<TodayAssignRequestModel> todayAssignReqeust();

  @GET("/api/v1/employee/get-notification?page=1&limit=10")
  Future<GetNotificationModel> getNotification();

  ////////////////////////////////  Client (user) ////////////////////////////
  ////////////////////////////////////////////////////////////////////////
  @POST("/api/v1/user/register")
  Future<CRegisterResModel> clientRegister(@Body() CRegisterBodyModel body);

  @POST("/api/v1/user/login")
  Future<CLoginResModel> clientLogin(@Body() CLoginBodyModel body);

  @POST("/api/v1/user/forgot-password")
  Future<CForgotPasswordResModel> clientForgotPassword(
    @Body() CForgotPasswordBodyModel body,
  );

  @POST("/api/v1/user/forgot-password-verify")
  Future<CVerfiOrCreatePassResModel> clientVerifyORCreatePassword(
    @Body() CVerfiOrCreatePassBodyModel body,
  );

  @GET("/api/v1/user/get-profile")
  Future<CProfileModel> clientProfile();

  @PUT("/api/v1/user/update-profile")
  Future<CUpdateProfileResModel> clientUpdateProfile(
    @Body() CUpdateProfileBodyModel body,
  );

  @GET("/api/v1/user/get-plan")
  Future<CgetPlanModel> clientGetPlan();

  @GET("/api/v1/user/get-service-list")
  Future<GetPlanServiceListModel> clientGetPlanService();

  @GET("/api/v1/user/get-plan?serviceId={id}")
  Future<GetPlanServiceDetailsModel> clientGetPlanServiceDetails(
    @Path('id') String id,
  );

  @POST("/api/v1/user/create-plan-request")
  Future<CreatePlanRequestResModel> clientCreatePlanRequest(
    @Body() CreatePlanRequestBodyModel body,
  );

  @GET("/api/v1/user/get-my-plan-request-service")
  Future<GetMyPlanRequestServiceModel> clientGetMyPlanRequestService();

  @POST("/api/v1/user/create-service-rquest")
  Future<CreateServiceRequestResModel> clientCreateSerivceRequest(
    @Body() CreateServiceRequestBodyModel body,
  );

  @GET("/api/v1/user/get-service-request?page=1&limit=10")
  Future<GetServiceRequestModel> clientGetServiceRequest(
    @Query("status") String status,
  );

  @POST("/api/v1/user/create-ticket")
  Future<ClientCreateTicketResModel> clientCreateTicket(
    @Body() ClientCreateTicketBodyModel body,
  );

  @GET("/api/v1/user/get-tickets?page=1&limit=10")
  Future<ClientGetTicketModel> clientGetTicket();

  @GET("/api/v1/user/get-service-request-details")
  Future<GetServiceRequestDetailsModel> clientGetServiceRequestDetails(
    @Query("serviceRequestId") String serviceRequestId,
  );

  @GET("/api/v1/user/get-service-reminders")
  Future<GetServiceReminderResponseModel> clientGetServiceReminders();

  @POST("/api/v1/user/report-issue")
  Future<void> reportIssue(@Body() ReportIssueBodyModel body);

  @POST("/api/v1/user/add-rating")
  Future<void> addRating(@Body() RatingBodyModel body);

  @POST("/api/v1/user/send-message")
  Future<void> sendMessageHelp(@Body() SendMessageRequest body);

  @GET("/api/v1/user/get-messages?requestId")
  Future<GetServiceReminderResponseModel> getMessage();

  @GET("/api/v1/user/get-notification?page=1&limit=10")
  Future<ClientNotificationModel> clientGetNotification();

  @GET("/api/v1/user/get-my-plan-request?page=1&limit=10")
  Future<CGetMyPlanRequestModel> clientGetMyPlanRequest();
}
