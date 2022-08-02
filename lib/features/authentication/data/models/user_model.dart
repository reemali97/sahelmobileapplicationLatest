class UserModel {
  List<String>? role;
  User? user;
  Group? group;

  UserModel({
    this.role,
    this.user,
    this.group,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      role: json['role'].cast<String>(),
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      group: json['group'] != null ? Group.fromJson(json['group']) : null,
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (group != null) {
      data['group'] = group!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? nationalityCode;
  String? nationalityName;
  int? idNumber;
  String? iqamaId;
  String? roleName;
  String? profileImageUrl;
  String? signatureImageUrl;
  bool? isEnabled;
  String? membershipNumber;
  String? area;
  String? city;
  String? neighborhood;
  String? userName;
  String? jobTitle;
  String? email;
  String? phoneNumber;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.fullName,
        this.nationalityCode,
        this.nationalityName,
        this.idNumber,
        this.iqamaId,
        this.roleName,
        this.profileImageUrl,
        this.signatureImageUrl,
        this.isEnabled,
        this.membershipNumber,
        this.area,
        this.city,
        this.neighborhood,
        this.userName,
        this.jobTitle,
        this.email,
        this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    nationalityCode = json['nationalityCode'];
    nationalityName = json['nationalityName'];
    idNumber = json['idNumber'];
    iqamaId = json['iqamaId'];
    roleName = json['roleName'];
    profileImageUrl = json['profileImageUrl'];
    signatureImageUrl = json['signatureImageUrl'];
    isEnabled = json['isEnabled'];
    membershipNumber = json['membershipNumber'];
    area = json['area'];
    city = json['city'];
    neighborhood = json['neighborhood'];
    userName = json['userName'];
    jobTitle = json['jobTitle'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['nationalityCode'] = nationalityCode;
    data['nationalityName'] = nationalityName;
    data['idNumber'] = idNumber;
    data['iqamaId'] = iqamaId;
    data['roleName'] = roleName;
    data['profileImageUrl'] = profileImageUrl;
    data['signatureImageUrl'] = signatureImageUrl;
    data['isEnabled'] = isEnabled;
    data['membershipNumber'] = membershipNumber;
    data['area'] = area;
    data['city'] = city;
    data['neighborhood'] = neighborhood;
    data['userName'] = userName;
    data['jobTitle'] = jobTitle;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}

class Group {
  int? id;
  String? nameAr;
  String? nameEn;
  int? roleId;
  bool? isActive;
  Role? role;
  String? groupsPermissions;
  List<UsersGroups>? usersGroups;
  String? createdOn;
  String? updatedOn;
  int? createdBy;
  String? updatedBy;

  Group(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.roleId,
        this.isActive,
        this.role,
        this.groupsPermissions,
        this.usersGroups,
        this.createdOn,
        this.updatedOn,
        this.createdBy,
        this.updatedBy});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    roleId = json['roleId'];
    isActive = json['isActive'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    groupsPermissions = json['groupsPermissions'];
    if (json['usersGroups'] != null) {
      usersGroups = <UsersGroups>[];
      json['usersGroups'].forEach((v) {
        usersGroups!.add(UsersGroups.fromJson(v));
      });
    }
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['roleId'] = roleId;
    data['isActive'] = isActive;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    data['groupsPermissions'] = groupsPermissions;
    if (usersGroups != null) {
      data['usersGroups'] = usersGroups!.map((v) => v.toJson()).toList();
    }
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    return data;
  }
}

class Role {
  String? nameAR;
  String? nameEN;
  int? id;
  String? name;
  String? normalizedName;
  String? concurrencyStamp;

  Role(
      {this.nameAR,
        this.nameEN,
        this.id,
        this.name,
        this.normalizedName,
        this.concurrencyStamp});

  Role.fromJson(Map<String, dynamic> json) {
    nameAR = json['nameAR'];
    nameEN = json['nameEN'];
    id = json['id'];
    name = json['name'];
    normalizedName = json['normalizedName'];
    concurrencyStamp = json['concurrencyStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameAR'] = nameAR;
    data['nameEN'] = nameEN;
    data['id'] = id;
    data['name'] = name;
    data['normalizedName'] = normalizedName;
    data['concurrencyStamp'] = concurrencyStamp;
    return data;
  }
}

class UsersGroups {
  int? id;
  int? usersID;
  Users? users;
  int? groupID;
  String? createdOn;
  String? updatedOn;
  int? createdBy;
  int? updatedBy;

  UsersGroups(
      {this.id,
        this.usersID,
        this.users,
        this.groupID,
        this.createdOn,
        this.updatedOn,
        this.createdBy,
        this.updatedBy});

  UsersGroups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usersID = json['usersID'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
    groupID = json['groupID'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['usersID'] = usersID;
    if (users != null) {
      data['users'] = users!.toJson();
    }
    data['groupID'] = groupID;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    return data;
  }
}

class Users {
  String? firstName;
  String? fatherName;
  String? grandFatherName;
  String? lastName;
  String? roleName;
  String? jobTitle;
  int? idNumber;
  String? iqamaId;
  String? nationalityCode;
  String? nationalityName;
  String? imageUrl;
  String? membershipNumber;
  String? profileImageUrl;
  String? signatureImageUrl;
  String? area;
  String? city;
  String? neighborhood;
  String? preferedLanguage;
  String? fcmToken;
  bool? isEnabled;
  String? phoneNumbers;
  List<UsersGroups>? usersGroups;
  int? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  String? lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  Users(
      {this.firstName,
        this.fatherName,
        this.grandFatherName,
        this.lastName,
        this.roleName,
        this.jobTitle,
        this.idNumber,
        this.iqamaId,
        this.nationalityCode,
        this.nationalityName,
        this.imageUrl,
        this.membershipNumber,
        this.profileImageUrl,
        this.signatureImageUrl,
        this.area,
        this.city,
        this.neighborhood,
        this.preferedLanguage,
        this.fcmToken,
        this.isEnabled,
        this.phoneNumbers,
        this.usersGroups,
        this.id,
        this.userName,
        this.normalizedUserName,
        this.email,
        this.normalizedEmail,
        this.emailConfirmed,
        this.passwordHash,
        this.securityStamp,
        this.concurrencyStamp,
        this.phoneNumber,
        this.phoneNumberConfirmed,
        this.twoFactorEnabled,
        this.lockoutEnd,
        this.lockoutEnabled,
        this.accessFailedCount});

  Users.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    fatherName = json['fatherName'];
    grandFatherName = json['grandFatherName'];
    lastName = json['lastName'];
    roleName = json['roleName'];
    jobTitle = json['jobTitle'];
    idNumber = json['idNumber'];
    iqamaId = json['iqamaId'];
    nationalityCode = json['nationalityCode'];
    nationalityName = json['nationalityName'];
    imageUrl = json['imageUrl'];
    membershipNumber = json['membershipNumber'];
    profileImageUrl = json['profileImageUrl'];
    signatureImageUrl = json['signatureImageUrl'];
    area = json['area'];
    city = json['city'];
    neighborhood = json['neighborhood'];
    preferedLanguage = json['preferedLanguage'];
    fcmToken = json['fcmToken'];
    isEnabled = json['isEnabled'];
    phoneNumbers = json['phoneNumbers'];
    if (json['usersGroups'] != null) {
      usersGroups = <UsersGroups>[];
      json['usersGroups'].forEach((v) {
        usersGroups!.add(UsersGroups.fromJson(v));
      });
    }
    id = json['id'];
    userName = json['userName'];
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
    normalizedEmail = json['normalizedEmail'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    concurrencyStamp = json['concurrencyStamp'];
    phoneNumber = json['phoneNumber'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    twoFactorEnabled = json['twoFactorEnabled'];
    lockoutEnd = json['lockoutEnd'];
    lockoutEnabled = json['lockoutEnabled'];
    accessFailedCount = json['accessFailedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['fatherName'] = fatherName;
    data['grandFatherName'] = grandFatherName;
    data['lastName'] = lastName;
    data['roleName'] = roleName;
    data['jobTitle'] = jobTitle;
    data['idNumber'] = idNumber;
    data['iqamaId'] = iqamaId;
    data['nationalityCode'] = nationalityCode;
    data['nationalityName'] = nationalityName;
    data['imageUrl'] = imageUrl;
    data['membershipNumber'] = membershipNumber;
    data['profileImageUrl'] = profileImageUrl;
    data['signatureImageUrl'] = signatureImageUrl;
    data['area'] = area;
    data['city'] = city;
    data['neighborhood'] = neighborhood;
    data['preferedLanguage'] = preferedLanguage;
    data['fcmToken'] = fcmToken;
    data['isEnabled'] = isEnabled;
    data['phoneNumbers'] = phoneNumbers;
    if (usersGroups != null) {
      data['usersGroups'] = usersGroups!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['userName'] = userName;
    data['normalizedUserName'] = normalizedUserName;
    data['email'] = email;
    data['normalizedEmail'] = normalizedEmail;
    data['emailConfirmed'] = emailConfirmed;
    data['passwordHash'] = passwordHash;
    data['securityStamp'] = securityStamp;
    data['concurrencyStamp'] = concurrencyStamp;
    data['phoneNumber'] = phoneNumber;
    data['phoneNumberConfirmed'] = phoneNumberConfirmed;
    data['twoFactorEnabled'] = twoFactorEnabled;
    data['lockoutEnd'] = lockoutEnd;
    data['lockoutEnabled'] = lockoutEnabled;
    data['accessFailedCount'] = accessFailedCount;
    return data;
  }
}