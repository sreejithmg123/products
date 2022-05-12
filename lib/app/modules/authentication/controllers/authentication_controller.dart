import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:products/app/modules/authentication/views/otp_verification_view.dart';
import 'package:products/app/modules/home/bindings/home_binding.dart';
import 'package:products/app/modules/home/views/home_view.dart';
import 'package:products/networking/operations.dart';

import '../../../../utils/sharedPreferenceManager.dart';

class AuthenticationController extends GetxController {
  //TODO: Implement AuthenticationController
  GoogleSignIn _googleSignIn = GoogleSignIn();
  static RxString userName = ''.obs;
  static RxString uId = ''.obs;
  TextEditingController mobileNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String otp = '';
  RxString errortext = ''.obs;
  RxString verificationCode = ''.obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> googleSignIn() async {
    try {
      await _googleSignIn.signIn().then((value) {
        userName.value = _googleSignIn.currentUser!.displayName!;
        uId.value = _googleSignIn.currentUser!.id;
        SharedPreferenceManager.instance.setBoolValue("isUserLoggedIn", true);
        SharedPreferenceManager.instance.setValue('uId', uId.value);
        SharedPreferenceManager.instance.setValue('userName', userName.value);

        Get.off(HomeView(), binding: HomeBinding());
      });
      update();
    } catch (e) {
      print(e);
    }
  }

  void goToOtpScreen() {
    if (!formKey.currentState!.validate()) {
      null;
    } else {
      Get.to(OtpVerificationView());
    }
  }

  verifyPhone() async {
    isLoading(true);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${mobileNumberController.text.trim()}',
        verificationCompleted: (phoneAuthCredential) async {
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          errortext.value = 'OTP verification failed';
        },
        codeSent: ((verificationId, forceResendingToken) {
          verificationCode.value = verificationId;
        }),
        codeAutoRetrievalTimeout: (verificationId) {
          null;
        },
        timeout: Duration(seconds: 60));
    isLoading(false);
    Get.to(OtpVerificationView());
  }

  verify() async {
    isLoading(true);

    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verificationCode.value, smsCode: otp))
          .then((value) {
        if (value.user != null) {
          userName.value = value.user!.displayName!;
          uId.value = value.user!.uid;
          SharedPreferenceManager.instance.setBoolValue("isUserLoggedIn", true);
          SharedPreferenceManager.instance.setValue('uId', uId.value);
          SharedPreferenceManager.instance.setValue('userName', userName.value);
          isLoading(false);
          Get.off(HomeView(), binding: HomeBinding());
        }
      });
    } catch (e) {
      isLoading(false);
      print('error ${e}');
    }
  }
}
