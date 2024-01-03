class UserModel {
  int id;
  String firstName;
  String lastName;
  String maidenName;
  int age;
  String gender;
  String email;
  String phone;
  String username;
  String password;
  String birthDate;
  String image;
  String bloodGroup;
  num height;
  num weight;
  String eyeColor;
  Hair hair;
  String domain;
  String ip;
  Address address;
  String macAddress;
  String university;
  Bank bank;
  Company company;
  String ein;
  String ssn;
  String userAgent;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.domain,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      maidenName: json["maidenName"],
      age: json["age"],
      gender: json["gender"],
      email: json["email"],
      phone: json["phone"],
      username: json["username"],
      password: json["password"],
      birthDate: json["birthDate"],
      image: json["image"],
      bloodGroup: json["bloodGroup"],
      height: json["height"],
      weight: json["weight"],
      eyeColor: json["eyeColor"],
      hair: Hair.fromJson(json["hair"]),
      domain: json["domain"],
      ip: json["ip"],
      address: Address.fromJson(json["address"]),
      macAddress: json["macAddress"],
      university: json["university"],
      bank: Bank.fromJson(json["bank"]),
      company: Company.fromJson(json["company"]),
      ein: json["ein"],
      ssn: json["ssn"],
      userAgent: json["userAgent"],
    );
  }
}

class Hair {
  String color;
  String type;

  Hair({
    required this.color,
    required this.type,
  });

  factory Hair.fromJson(Map<String, dynamic> json) {
    return Hair(
      color: json["color"],
      type: json["type"],
    );
  }
}

class CoOrdinate {
  num lat;
  num lng;

  CoOrdinate({
    required this.lat,
    required this.lng,
  });

  factory CoOrdinate.fromJson(Map<String, dynamic> json) {
    return CoOrdinate(
      lat: json["lat"],
      lng: json["lng"],
    );
  }
}

class Address {
  String address;
  String? city;
  String postalCode;
  CoOrdinate coordinates;
  String state;

  Address({
    required this.address,
    required this.city,
    required this.postalCode,
    required this.coordinates,
    required this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address: json["address"],
      city: json["city"],
      coordinates: CoOrdinate.fromJson(json["coordinates"]),
      postalCode: json["postalCode"],
      state: json["state"],
    );
  }
}

class Bank {
  String cardExpire;
  String cardNumber;
  String cardType;
  String currency;
  String iban;

  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      cardExpire: json["cardExpire"],
      cardNumber: json["cardNumber"],
      cardType: json["cardType"],
      currency: json["currency"],
      iban: json["iban"],
    );
  }
}

class Company {
  Address address;
  String department;
  String name;
  String title;

  Company({
    required this.address,
    required this.department,
    required this.name,
    required this.title,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      address: Address.fromJson(json["address"]),
      department: json["department"],
      name: json["name"],
      title: json["title"],
    );
  }
}

class UserDataModel {
  int total;
  int skip;
  int limit;
  List<UserModel> users;

  UserDataModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.users,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    List<UserModel> allUsers = [];

    for (Map<String, dynamic> eachUser in json["users"]) {
      allUsers.add(UserModel.fromJson(eachUser));
    }

    return UserDataModel(
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
      users: allUsers,
    );
  }
}
