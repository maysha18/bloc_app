class LoginModel {
  UserLoginAPI? _userLoginAPI;

  LoginModel({UserLoginAPI? userLoginAPI}) {
    if (userLoginAPI != null) {
      this._userLoginAPI = userLoginAPI;
    }
  }

  UserLoginAPI? get userLoginAPI => _userLoginAPI;
  set userLoginAPI(UserLoginAPI? userLoginAPI) => _userLoginAPI = userLoginAPI;

  LoginModel.fromJson(Map<String, dynamic> json) {
    _userLoginAPI = json['UserLoginAPI'] != null
        ? new UserLoginAPI.fromJson(json['UserLoginAPI'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._userLoginAPI != null) {
      data['UserLoginAPI'] = this._userLoginAPI!.toJson();
    }
    return data;
  }
}

class UserLoginAPI {
  String? _errorCode;
  String? _result;
  List<Response>? _response;

  UserLoginAPI({String? errorCode, String? result, List<Response>? response}) {
    if (errorCode != null) {
      this._errorCode = errorCode;
    }
    if (result != null) {
      this._result = result;
    }
    if (response != null) {
      this._response = response;
    }
  }

  String? get errorCode => _errorCode;
  set errorCode(String? errorCode) => _errorCode = errorCode;
  String? get result => _result;
  set result(String? result) => _result = result;
  List<Response>? get response => _response;
  set response(List<Response>? response) => _response = response;

  UserLoginAPI.fromJson(Map<String, dynamic> json) {
    _errorCode = json['ErrorCode'];
    _result = json['Result'];
    if (json['Response'] != null) {
      _response = <Response>[];
      json['Response'].forEach((v) {
        _response!.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrorCode'] = this._errorCode;
    data['Result'] = this._result;
    if (this._response != null) {
      data['Response'] = this._response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? _userID;
  String? _userName;
  String? _designation;
  String? _mobileNo;
  String? _memberType;
  String? _firmName;
  String? _dateOfBirth;
  String? _dateOfAnniversary;
  String? _language;
  String? _address;
  String? _option;
  String? _captchaCode;
  String? _oTPCode;
  String? _profileImage;

  Response(
      {String? userID,
      String? userName,
      String? designation,
      String? mobileNo,
      String? memberType,
      String? firmName,
      String? dateOfBirth,
      String? dateOfAnniversary,
      String? language,
      String? address,
      String? option,
      String? captchaCode,
      String? oTPCode,
      String? profileImage}) {
    if (userID != null) {
      this._userID = userID;
    }
    if (userName != null) {
      this._userName = userName;
    }
    if (designation != null) {
      this._designation = designation;
    }
    if (mobileNo != null) {
      this._mobileNo = mobileNo;
    }
    if (memberType != null) {
      this._memberType = memberType;
    }
    if (firmName != null) {
      this._firmName = firmName;
    }
    if (dateOfBirth != null) {
      this._dateOfBirth = dateOfBirth;
    }
    if (dateOfAnniversary != null) {
      this._dateOfAnniversary = dateOfAnniversary;
    }
    if (language != null) {
      this._language = language;
    }
    if (address != null) {
      this._address = address;
    }
    if (option != null) {
      this._option = option;
    }
    if (captchaCode != null) {
      this._captchaCode = captchaCode;
    }
    if (oTPCode != null) {
      this._oTPCode = oTPCode;
    }
    if (profileImage != null) {
      this._profileImage = profileImage;
    }
  }

  String get userID => _userID ?? "";
  set userID(String? userID) => _userID = userID;
  String get userName => _userName ?? "";
  set userName(String? userName) => _userName = userName;
  String get designation => _designation ?? "";
  set designation(String? designation) => _designation = designation;
  String get mobileNo => _mobileNo ?? "";
  set mobileNo(String? mobileNo) => _mobileNo = mobileNo;
  String get memberType => _memberType ?? "";
  set memberType(String? memberType) => _memberType = memberType;
  String get firmName => _firmName ?? "";
  set firmName(String? firmName) => _firmName = firmName;
  String get dateOfBirth => _dateOfBirth ?? "";
  set dateOfBirth(String? dateOfBirth) => _dateOfBirth = dateOfBirth;
  String get dateOfAnniversary => _dateOfAnniversary ?? "";
  set dateOfAnniversary(String? dateOfAnniversary) =>
      _dateOfAnniversary = dateOfAnniversary;
  String get language => _language ?? "";
  set language(String? language) => _language = language;
  String get address => _address ?? "";
  set address(String? address) => _address = address;
  String get option => _option ?? "";
  set option(String? option) => _option = option;
  String get captchaCode => _captchaCode ?? "";
  set captchaCode(String? captchaCode) => _captchaCode = captchaCode;
  String get oTPCode => _oTPCode ?? "";
  set oTPCode(String? oTPCode) => _oTPCode = oTPCode;
  String get profileImage => _profileImage ?? "";
  set profileImage(String? profileImage) => _profileImage = profileImage;

  Response.fromJson(Map<String, dynamic> json) {
    _userID = json['UserID'];
    _userName = json['UserName'];
    _designation = json['Designation'];
    _mobileNo = json['MobileNo'];
    _memberType = json['MemberType'];
    _firmName = json['FirmName'];
    _dateOfBirth = json['DateOfBirth'];
    _dateOfAnniversary = json['DateOfAnniversary'];
    _language = json['Language'];
    _address = json['Address'];
    _option = json['Option'];
    _captchaCode = json['CaptchaCode'];
    _oTPCode = json['OTPCode'];
    _profileImage = json['ProfileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this._userID;
    data['UserName'] = this._userName;
    data['Designation'] = this._designation;
    data['MobileNo'] = this._mobileNo;
    data['MemberType'] = this._memberType;
    data['FirmName'] = this._firmName;
    data['DateOfBirth'] = this._dateOfBirth;
    data['DateOfAnniversary'] = this._dateOfAnniversary;
    data['Language'] = this._language;
    data['Address'] = this._address;
    data['Option'] = this._option;
    data['CaptchaCode'] = this._captchaCode;
    data['OTPCode'] = this._oTPCode;
    data['ProfileImage'] = this._profileImage;
    return data;
  }
}
