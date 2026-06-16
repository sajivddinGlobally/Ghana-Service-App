import 'dart:developer';
import 'dart:io';
import 'package:dwelleasy_ghana/core/network/api.stateNetwork.dart';
import 'package:dwelleasy_ghana/core/utils/showMessage.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CForgotPassBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CForgotPassResModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CGetMyPlanRequestModel.dart'
    show CGetMyPlanRequestModel;
import 'package:dwelleasy_ghana/data/ClientModel/CGetPlanModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CLoginBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CProfileModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CRegisterBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CUpdateProfileBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CUpdateProfileResModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CVerifyOrCreatePassBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CVerifyOrCreatePassResModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/clientCreateTicketBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/clientGetTicketModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/clientNotificationModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/createPlanReqiestBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/createServiceRequestBodyModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getActivePlanModel.dart'
    hide
        PlanDetails,
        PaymentAndBilling,
        Declaration,
        PersonalInformation,
        PropertyDetails;
import 'package:dwelleasy_ghana/data/ClientModel/getDashbordCountModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getMyPlanRequestServiceModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getPlanServiceDetailsModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getPlanServiceListModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getRatingModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getServiceRequestModel.dart'
    hide
        PersonalInformation,
        PropertyDetails,
        PlanDetails,
        PaymentAndBilling,
        Declaration;
import 'package:dwelleasy_ghana/data/model/acceptRequestBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/acceptRequestResModel.dart'
    hide
        PersonalInformation,
        PropertyDetails,
        PlanDetails,
        PaymentAndBilling,
        Declaration;
import 'package:dwelleasy_ghana/data/model/createLeaveRequestBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/createLeaveRequestResModel.dart';
import 'package:dwelleasy_ghana/data/model/createTicketBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/forgotPasswordBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/forgotPasswordResModel.dart';
import 'package:dwelleasy_ghana/data/model/getArriveModel.dart' hide PersonalInformation, PlanDetails, PropertyDetails, PaymentAndBilling, Declaration;
import 'package:dwelleasy_ghana/data/model/getAssignCountModel.dart';
import 'package:dwelleasy_ghana/data/model/getAssigneRequestModel.dart'
    hide
        PersonalInformation,
        PropertyDetails,
        PlanDetails,
        PaymentAndBilling,
        Declaration;
import 'package:dwelleasy_ghana/data/model/getCompleteRequestModel.dart'
    hide
        PersonalInformation,
        PropertyDetails,
        PlanDetails,
        Declaration,
        PaymentAndBilling;
import 'package:dwelleasy_ghana/data/model/getMyLeaveModel.dart';
import 'package:dwelleasy_ghana/data/model/getNotificationModel.dart';
import 'package:dwelleasy_ghana/data/model/getOnTheWayModel.dart' hide PersonalInformation, PropertyDetails, PlanDetails, PaymentAndBilling, Declaration;
import 'package:dwelleasy_ghana/data/model/getPendingRequestModel.dart'
    hide
        PersonalInformation,
        PropertyDetails,
        PlanDetails,
        PaymentAndBilling,
        Declaration;
import 'package:dwelleasy_ghana/data/model/getProfileModel.dart';
import 'package:dwelleasy_ghana/data/model/getServiceResModel.dart';
import 'package:dwelleasy_ghana/data/model/getTicketModel.dart';
import 'package:dwelleasy_ghana/data/model/inProgressModel.dart'
    hide
        PersonalInformation,
        PropertyDetails,
        PlanDetails,
        PaymentAndBilling,
        Declaration;
import 'package:dwelleasy_ghana/data/model/jobDoneModel.dart';
import 'package:dwelleasy_ghana/data/model/loginBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/onTheWayBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/readNotificationModel.dart';
import 'package:dwelleasy_ghana/data/model/registerBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/requestCompleteBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/sendMessageBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/serviceRequestDetailModel.dart'
    hide
        PersonalInformation,
        PropertyDetails,
        PlanDetails,
        PaymentAndBilling,
        Declaration;
import 'package:dwelleasy_ghana/data/model/todayAssignRequestModel.dart'
    hide
        PersonalInformation,
        PropertyDetails,
        PlanDetails,
        PaymentAndBilling,
        Declaration;
import 'package:dwelleasy_ghana/data/model/todayPendngRequestModel.dart'
    hide
        PropertyDetails,
        PersonalInformation,
        PlanDetails,
        PaymentAndBilling,
        Declaration;
import 'package:dwelleasy_ghana/data/model/updateProfileBodyModel.dart';
import 'package:dwelleasy_ghana/data/model/updateProfileResModel.dart';
import 'package:dwelleasy_ghana/data/model/verifyOrCreatePasswordBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../data/model/addRatingRequestModel.dart';
import '../../data/model/getServiceRequestDetailsModel.dart'
    hide
        PersonalInformation,
        PropertyDetails,
        PlanDetails,
        PaymentAndBilling,
        Declaration;
import '../../data/model/serviceReminderResponseModel.dart';
// import '../../data/ClientModel/CGetMyPlanRequestModel.dart'
//     show CGetMyPlanRequestModel, GetMyPlanRequestModel;

class AuthService {
  final ApiStateNetwork api;

  AuthService(this.api);

  Future<GetServiceResModel> getAllService() async {
    try {
      final response = await api.getAllService();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return response;
    } catch (e, st) {
      throw Exception(e.toString());
    }
  }

  Future<bool> employeeLogin({
    required String email,
    required String password,
    String? deviceId,
    required BuildContext context,
  }) async {
    try {
      final body = LoginBodyModel(
        email: email,
        password: password,
        deviceId: deviceId,
      );
      final response = await api.loginEmployee(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Login Success");
        final box = Hive.box("employeeBox");
        await box.put("token", response.data?.token ?? "");
        await box.put("id", response.data?.id ?? "");
      }
      return true;
    } catch (e, st) {
      log("LOGIN ERROR => $e");
      log("STACK TRACE => $st");
      return false;
    }
  }

  Future<bool> registerEmployee({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String serviceId,
    required String password,
    String? deviceId,
    required BuildContext context,
  }) async {
    try {
      final body = RegisterBodyModel(
        fullName: fullName,
        email: email,
        phone: phoneNumber,
        password: password,
        serviceId: serviceId,
        deviceId: deviceId,
      );
      final response = await api.employeeRegister(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Success");
      }
      return true;
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return false;
    }
  }

  Future<GetProfileModel> getProfile() async {
    try {
      final response = await api.getProfile();
      if (response.error == false && response.code == 1) {
        return response;
      }
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UpdateProfileResModel?> updateProfile({
    File? uploadImage,
    String? existingImage,
    required String fullName,
    required String phone,
    required String city,
    required String address,
    required String experience,
    required String availability,
    required String serviceId,
    required BuildContext context,
  }) async {
    try {
      String imageUrl = existingImage ?? "";
      if (uploadImage != null) {
        final uploadResponse = await api.uploadImage(uploadImage);

        if (uploadResponse.code == 0 && uploadResponse.error == false) {
          imageUrl = uploadResponse.data?.imageUrl ?? "";
        }
      }
      final body = UpdateProfileBodyModel(
        fullName: fullName,
        phone: phone,
        city: city,
        address: address,
        experience: experience,
        availability: availability,
        image: imageUrl,
        serviceId: serviceId,
      );
      final profileResponse = await api.updateProfile(body);
      if (profileResponse.code == 0 && profileResponse.error == false) {
        return profileResponse;
      }
      return profileResponse;
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      showErrorMessage(context: context, message: e.toString());
      return null;
    }
  }

  Future<ForgotPasswordResModel> forgotPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      final body = ForgotPasswordBodyModel(email: email);
      final response = await api.forgotPassword(body);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> verifyOrCreatePassword({
    required String token,
    required String otp,
    required String password,
    required String confirmpassword,
    required BuildContext context,
  }) async {
    try {
      final body = VerifyOrCreatePasswordBody(
        token: token,
        otp: otp,
        password: password,
        confirmPassword: confirmpassword,
      );
      final response = await api.verifyOrCreateNewPassword(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Sucess");
        showSuccessSnackBar("Password Update Successfully");
        return true;
      }
      return true;
    } catch (e, st) {
      log(st.toString());
      return false;
    }
  }

  Future<ForgotPasswordResModel?> resendPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      final body = ForgotPasswordBodyModel(email: email);
      final response = await api.forgotPassword(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Sucess");
        return response;
      }
    } catch (e, st) {
      log(st.toString());
      return null;
    }
  }

  Future<CreateLeaveRquestResModel?> createLeaveRequest({
    required int date,
    required String reason,
  }) async {
    try {
      final body = CreateLeaveRquestBodyModel(leaveDate: date, reason: reason);
      final response = await api.createLeaveRequest(body);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<GetMyLeaveModel> fetchAllLeave() async {
    try {
      final response = await api.myLeaveRequest();
      if (response.error == false && response.code == 1) {
        return response;
      }
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> createTicket({
    required String subject,
    required String desc,
  }) async {
    try {
      final body = CreateTicketBodyModel(subject: subject, description: desc);
      final response = await api.createTicket(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Login Success");
        showSuccessSnackBar(response.message ?? "Sucess");
        return true;
      }
      return false;
    } catch (e, st) {
      log("ERROR => $e");
      log("STACK TRACE => $st");
      return false;
    }
  }

  Future<GetTicketModel> getTicket() async {
    try {
      final response = await api.getTicket();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<GetAssignCount> getAssignCount() async {
    try {
      final response = await api.getAssignCount();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<GetAssignedRequestsModel> getAssignRequestList({
    required int page,
    int limit = 10,
  }) async {
    try {
      final response = await api.getAssignRequest(page, limit);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  Future<GetPendingRequestsModel> getPendingRequestList() async {
    try {
      final response = await api.getPendingRequest();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<GetCompleteRequestsModel> getCompleteRequestList() async {
    try {
      final response = await api.getCompleteRequest();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<InProgressModel> getInProgress() async {
    try {
      final response = await api.inProgress();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<TodayAssignRequestModel> todayAssignRequest() async {
    try {
      final response = await api.todayAssignReqeust();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<TodayPendingRequestModel> todayPendingRequest() async {
    try {
      final response = await api.todayPendingReqeust();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  Future<TodayPendingRequestModel> pendingRequest() async {
    try {
      final response = await api.pendingReqeust();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  Future<AcceptRequestResModel> acceptRequest({
    required String requestId,
  }) async {
    try {
      final body = AcceptRequestBodyModel(requestId: requestId);
      final response = await api.acceptRequest(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Login Success");
        showSuccessSnackBar(response.message ?? "Sucess");
        return response;
      }
      return throw Exception(response.message);
    } catch (e, st) {
      log("ERROR => $e");
      log("STACK TRACE => $st");
      return throw Exception(e);
    }
  }

  Future<bool> sendMessage({
    required String requestId,
    required String message,
  }) async {
    try {
      final body = SendMessageBodyModel(requestId: requestId, message: message);
      final response = await api.sendMessage(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Login Success");
        showSuccessSnackBar(response.message ?? "Sucess");
        return true;
      }
      return false;
    } catch (e, st) {
      log("ERROR => $e");
      log("STACK TRACE => $st");
      return false;
    }
  }

  Future<bool> rejectRequest({
    required String requestId,
    required String message,
  }) async {
    try {
      final body = SendMessageBodyModel(requestId: requestId, message: message);
      final response = await api.rejectRequest(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Login Success");
        showSuccessSnackBar(response.message ?? "Sucess");
        return true;
      }
      return false;
    } catch (e, st) {
      log("ERROR => $e");
      log("STACK TRACE => $st");
      return false;
    }
  }

  Future<bool> requestComplete({
    File? uploadImage,
    required String requestId,
    required String remark,
  }) async {
    try {
      String imageUrl = "";
      if (uploadImage != null) {
        final uploadResponse = await api.uploadImage(uploadImage);

        if (uploadResponse.code == 0 && uploadResponse.error == false) {
          imageUrl = uploadResponse.data?.imageUrl ?? "";
        }
      }
      final body = RequestCompleteBodyModel(
        requestId: requestId,
        remark: remark,
        image: imageUrl,
      );
      final response = await api.requestComplete(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Login Success");
        showSuccessSnackBar(response.message ?? "Sucess");
        return true;
      }
      return false;
    } catch (e, st) {
      log("ERROR => $e");
      log("STACK TRACE => $st");
      return false;
    }
  }

  // Future<GetNotificationModel> getNotification() async {
  //   try {
  //     final response = await api.getNotification();
  //     if (response.code == 0 && response.error == false) {
  //       return response;
  //     }
  //     return throw Exception(response.message);
  //   } catch (e, st) {
  //     log(st.toString());
  //     throw Exception(e.toString());
  //   }
  // }
  Future<GetNotificationModel> getNotification({
    required int page,
    int limit = 10,
  }) async {
    try {
      final response = await api.getNotification(page, limit);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  Future<ReadNotificationModel> readNotification() async {
    try {
      final response = await api.readNotification();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  Future<JobDoneModel> jobDone() async {
    try {
      final response = await api.jobDone();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  Future<bool> onTheWay({required String requestId}) async {
    try {
      final body = OnTheWayBodyModel(requestId: requestId);
      final response = await api.onTheWay(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Login Success");
        return true;
      }
      return false;
    } catch (e, st) {
      log("ERROR => $e");
      log("STACK TRACE => $st");
      return false;
    }
  }

  Future<bool> employeeArrived({required String requestId}) async {
    try {
      final body = OnTheWayBodyModel(requestId: requestId);
      final response = await api.employeeArrived(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Login Success");
        return true;
      }
      return false;
    } catch (e, st) {
      log("ERROR => $e");
      log("STACK TRACE => $st");
      return false;
    }
  }

   Future<GetOnTheWayModel> getOnTheWayData({
    required int page,
    int limit = 10,
  }) async {
    try {
      final response = await api.getOnTheWay(page, limit);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  Future<GetArriveModel> getArriveData({
    required int page,
    int limit = 10,
  }) async {
    try {
      final response = await api.getArrive(page, limit);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }


  Future<ServiceRequestDetailModel> serviceRequestDetails({
    required String requestId,
  }) async {
    try {
      final response = await api.serviceRequestDetails(requestId);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  /////////////////////////////////  Client (User) //////////////////////////////
  Future<bool> clientRegister({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
    String? deviceId,
    required BuildContext context,
  }) async {
    try {
      final body = CRegisterBodyModel(
        fullName: fullName,
        email: email,
        phone: phoneNumber,
        password: password,
        deviceId: deviceId,
      );
      final response = await api.clientRegister(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Success");
        showSuccessSnackBar(response.message ?? "");
        return true;
      }
      return false;
    } catch (e, st) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> clientLogin({
    required String email,
    required String password,
    String? deviceId,
  }) async {
    try {
      final body = CLoginBodyModel(
        email: email,
        password: password,
        deviceId: deviceId,
      );
      final response = await api.clientLogin(body);
      if (response.code == 0 && response.error == false) {
        var box = Hive.box("clientBox");
        await box.put("token", response.data!.token);
        await box.put("id", response.data!.id);
        log(response.message ?? "Success");
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<CForgotPasswordResModel> clientForgotPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      final body = CForgotPasswordBodyModel(email: email);
      final response = await api.clientForgotPassword(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Success");
        return response;
      }
      throw Exception(response.message ?? "Something went wrong");
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<CVerfiOrCreatePassResModel> clientVerifyOrCreatePassword({
    required String token,
    required String otp,
    required String password,
    required String confirmpassword,
    required BuildContext context,
  }) async {
    try {
      final body = CVerfiOrCreatePassBodyModel(
        token: token,
        otp: otp,
        password: password,
        confirmPassword: confirmpassword,
      );
      final response = await api.clientVerifyORCreatePassword(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Sucess");
        showSuccessSnackBar("Password Update Successfully");
        return response;
      }
      return throw Exception(response.message ?? "Error");
    } catch (e, st) {
      log(e.toString());
      return throw Exception(e.toString());
    }
  }

  Future<CForgotPasswordResModel> clientResendOTP({
    required String email,
    required BuildContext context,
  }) async {
    try {
      final body = CForgotPasswordBodyModel(email: email);
      final response = await api.clientForgotPassword(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Success");
        return response;
      }
      throw Exception(response.message ?? "Something went wrong");
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<CProfileModel> clientGetProfile() async {
    try {
      final response = await api.clientProfile();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<CUpdateProfileResModel> clientUpdateProfile({
    File? uploadImage,
    required String fullName,
    required String phone,
    required String address,
    String? existingImage,
    required BuildContext context,
  }) async {
    try {
      String imageUrl = existingImage ?? "";
      if (uploadImage != null) {
        final uploadResponse = await api.uploadImage(uploadImage);

        if (uploadResponse.code == 0 && uploadResponse.error == false) {
          imageUrl = uploadResponse.data?.imageUrl ?? imageUrl;
        }
      }
      final body = CUpdateProfileBodyModel(
        fullName: fullName,
        phone: phone,
        address: address,
        image: imageUrl,
      );
      log("FINAL IMAGE URL => $imageUrl");
      final profileResponse = await api.clientUpdateProfile(body);
      if (profileResponse.code == 0 && profileResponse.error == false) {
        return profileResponse;
      }
      return throw Exception(profileResponse.message);
    } catch (e, st) {
      log(e.toString());
      return throw Exception(e.toString());
    }
  }

  Future<CgetPlanModel> clientGetPlan() async {
    try {
      final response = await api.clientGetPlan();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<GetPlanServiceListModel> clientGetPlanService() async {
    try {
      final response = await api.clientGetPlanService();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<GetPlanServiceDetailsModel> clientGetPlanServiceDetails({
    required String id,
  }) async {
    try {
      final response = await api.clientGetPlanServiceDetails(id);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> clientCreatePlanRequest({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String alterNativePhoneNumber,
    required String nationalId,
    required String propertyAddress,
    required String bedrooms,
    required int bathrooms,
    required int acUnits,
    required String propertyType,
    required String propertyAge,
    required String serviceId,
    required String planId,
    required String paymentMethod1,
    required String mobileMoneyNumber,
    required int preferredBillingDate,
    required String howDidYouHearAboutUs,
    required bool informationAccurate,
    required bool planStartsAfter14Days,
    required bool agreeTermsAndConditions,
    required bool noPreExistingFaults,
    required String electronicSignature,

    required String date,
    required String paymentMethod,
  }) async {
    try {
      final body = CreatePlanRequestBodyModel(
        personalInformation: PersonalInformation(
          fullName: fullName,
          email: email,
          phoneNumber: phoneNumber,
          alternativePhoneNumber: alterNativePhoneNumber,
          nationalId: nationalId,
          propertyAddress: propertyAddress,
        ),
        propertyDetails: PropertyDetails(
          bedrooms: bedrooms,
          bathrooms: bathrooms,
          acUnits: acUnits,
          propertyType: propertyType,
          propertyAge: propertyAge,
        ),
        planDetails: PlanDetails(serviceId: serviceId, planId: planId),
        paymentAndBilling: PaymentAndBilling(
          paymentMethod: paymentMethod1,
          mobileMoneyNumber: mobileMoneyNumber,
          preferredBillingDate: preferredBillingDate,
          howDidYouHearAboutUs: howDidYouHearAboutUs,
        ),
        declaration: Declaration(
          informationAccurate: informationAccurate,
          planStartsAfter14Days: planStartsAfter14Days,
          agreeTermsAndConditions: agreeTermsAndConditions,
          noPreExistingFaults: noPreExistingFaults,
          electronicSignature: electronicSignature,

          date: date,
        ),
        // paymentMethod: "cash",
        paymentMethod: paymentMethod,
      );
      log(body.toJson().toString());
      final response = await api.clientCreatePlanRequest(body);

      if (response.code == 0 && response.error == false) {
        // log(response.message ?? "Plan Request Success");

        return true;
      }
      return false;
    } catch (e, st) {
      log("CREATE PLAN REQUEST ERROR => $e");
      log("STACK TRACE => $st");

      return false;
    }
  }

  Future<GetMyPlanRequestServiceModel> clientGetMyPlanRequestService() async {
    try {
      final response = await api.clientGetMyPlanRequestService();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> clientCreateSerivceRequest({
    required String serviceId,
    required String desc,
    required int preffrerData,
  }) async {
    try {
      final body = CreateServiceRequestBodyModel(
        serviceId: serviceId,
        description: desc,
        preferredDate: preffrerData,
      );
      final response = await api.clientCreateSerivceRequest(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Login Success");
        return true;
      }
      return false;
    } catch (e, st) {
      log("ERROR => $e");
      log("STACK TRACE => $st");
      return false;
    }
  }

  Future<GetServiceRequestModel> clientGetServiceRequest({
    required int page,
    int limit = 10,
    required String status,
  }) async {
    try {
      final response = await api.clientGetServiceRequest(page, limit, status);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  Future<bool> clientCreateTicket({
    required String subject,
    required String desc,
  }) async {
    try {
      final body = ClientCreateTicketBodyModel(
        subject: subject,
        description: desc,
      );
      final response = await api.clientCreateTicket(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Login Success");
        showSuccessSnackBar(response.message ?? "Sucess");
        return true;
      }
      return false;
    } catch (e, st) {
      log("ERROR => $e");
      log("STACK TRACE => $st");
      return false;
    }
  }

  Future<ClientGetTicketModel> clientGetTicket({
    required int page,
    int limit = 10,
  }) async {
    try {
      final response = await api.clientGetTicket(page, limit);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<GetServiceRequestDetailsModel> clientGetServiceRequestDetails({
    required String serviceRequestId,
  }) async {
    try {
      final response = await api.clientGetServiceRequestDetails(
        serviceRequestId,
      );

      if (response.code == 0 && response.error == false) {
        return response;
      }

      throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<GetServiceReminderResponseModel> clientGetServiceReminders() async {
    try {
      final response = await api.clientGetServiceReminders();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> reportIssue({
    required String serviceRequestId,
    required String issueType,
    required String description,
  }) async {
    try {
      final body = ReportIssueBodyModel(
        serviceRequestId: serviceRequestId,
        issueType: issueType,
        description: description,
      );
      final response = await api.reportIssue(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Login Success");
        return true;
      }
      return false;
    } catch (e, st) {
      log("ERROR => $e");
      log("STACK TRACE => $st");
      return false;
    }
  }

  Future<bool> addRating({
    required String serviceRequestId,
    required int rating,
    required String message,
  }) async {
    try {
      final body = RatingBodyModel(
        serviceRequestId: serviceRequestId,
        message: message,
        rating: rating,
      );
      final response = await api.addRating(body);
      if (response.code == 0 && response.error == false) {
        log(response.message ?? "Login Success");
        return true;
      }
      return false;
    } catch (e, st) {
      log("ERROR => $e");
      log("STACK TRACE => $st");
      return false;
    }
  }

  Future<bool> sendMessageHelp({
    required String requestId,
    required String message,
  }) async {
    try {
      final body = SendMessageRequest(requestId: '', message: '');
      final response = await api.sendMessageHelp(body);
      // if (response.code == 0 && response.error == false) {
      //   log(response.message ?? "Login Success");
      //   return true;
      // }
      return false;
    } catch (e, st) {
      log("ERROR => $e");
      log("STACK TRACE => $st");
      return false;
    }
  }

  Future<GetServiceReminderResponseModel> getMessage() async {
    try {
      final response = await api.getMessage();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ClientNotificationModel> clientGetNotification({
    required int page,
    int limit = 10,
  }) async {
    try {
      final response = await api.clientGetNotification(page, limit);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  Future<CGetMyPlanRequestModel> clientGetMyPlanRequest({
    required int page,
    int limit = 10,
  }) async {
    try {
      final response = await api.clientGetMyPlanRequest(page, limit);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  Future<ReadNotificationModel> clientReadNotification() async {
    try {
      final response = await api.clientReadNotification();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  Future<GetRatingModel> clientGetRating({required String requstId}) async {
    try {
      final response = await api.clientGetRating(requstId);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e, st) {
      log(st.toString());
      throw Exception(e.toString());
    }
  }

  Future<GetActivePlanModel> clientGetActivePlan({
    required int page,
    int limit = 10,
  }) async {
    try {
      final response = await api.getActivePlan(page, limit);
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<GetDashbordCountModel> clientGetDashbordCount() async {
    try {
      final response = await api.getDashbordCount();
      if (response.code == 0 && response.error == false) {
        return response;
      }
      return throw Exception(response.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
