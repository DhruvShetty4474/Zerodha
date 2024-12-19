

//check the state of the radio button...
enum ForgetPasswordState { remember, forget }
class RadioButtonState{
  final ForgetPasswordState selectedState;

  RadioButtonState(this.selectedState);

  /// Determines whether the "User ID" field should be displayed
  bool shouldShowUserIdField() {
    return selectedState == ForgetPasswordState.remember;
  }
}



//value for selecting where to receive OTP...
enum OtpReceiver { sms, email }

class OtpReceiverState{
  final OtpReceiver otpReceiver;

  OtpReceiverState(this.otpReceiver);

  bool shouldChangeLabelText(){
    return otpReceiver == OtpReceiver.sms;
  }
}