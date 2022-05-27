class ServiceProviderModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  int? otpCode;
  dynamic altMobileNumber;
  String? emailVerificationToken;
  String? otpVerificationToken;
  String? emailVerificationDate;
  int? userTypeId;
  String? ip;
  String? userAgent;
  int? isEmailVerified;
  int? isMobileVerified;
  int? isActive;
  int? isBlocked;
  int? isFeatured;
  int? isSlider;
  String? availableBalance;
  String? totalEarnings;
  String? siteCommissions;
  int? rating;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  ServiceProviderModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.otpCode,
        this.altMobileNumber,
        this.emailVerificationToken,
        this.otpVerificationToken,
        this.emailVerificationDate,
        this.userTypeId,
        this.ip,
        this.userAgent,
        this.isEmailVerified,
        this.isMobileVerified,
        this.isActive,
        this.isBlocked,
        this.isFeatured,
        this.isSlider,
        this.availableBalance,
        this.totalEarnings,
        this.siteCommissions,
        this.rating,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  ServiceProviderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    otpCode = json['otp_code'];
    altMobileNumber = json['alt_mobile_number'];
    emailVerificationToken = json['email_verification_token'];
    otpVerificationToken = json['otp_verification_token'];
    emailVerificationDate = json['email_verification_date'];
    userTypeId = json['user_type_id'];
    ip = json['ip'];
    userAgent = json['user_agent'];
    isEmailVerified = json['is_email_verified'];
    isMobileVerified = json['is_mobile_verified'];
    isActive = json['is_active'];
    isBlocked = json['is_blocked'];
    isFeatured = json['is_featured'];
    isSlider = json['is_slider'];
    availableBalance = json['available_balance'];
    totalEarnings = json['total_earnings'];
    siteCommissions = json['site_commissions'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['otp_code'] = otpCode;
    data['alt_mobile_number'] = altMobileNumber;
    data['email_verification_token'] = emailVerificationToken;
    data['otp_verification_token'] = otpVerificationToken;
    data['email_verification_date'] = emailVerificationDate;
    data['user_type_id'] = userTypeId;
    data['ip'] = ip;
    data['user_agent'] = userAgent;
    data['is_email_verified'] = isEmailVerified;
    data['is_mobile_verified'] = isMobileVerified;
    data['is_active'] = isActive;
    data['is_blocked'] = isBlocked;
    data['is_featured'] = isFeatured;
    data['is_slider'] = isSlider;
    data['available_balance'] = availableBalance;
    data['total_earnings'] = totalEarnings;
    data['site_commissions'] = siteCommissions;
    data['rating'] = rating;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
