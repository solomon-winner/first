class Welcome {
    int id;
    String username;
    String email;
    String firstName;
    String lastName;
    String gender;
    String image;
    String token;
    String refreshToken;

    Welcome({
        required this.id,
        required this.username,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.image,
        required this.token,
        required this.refreshToken,
    });

    Welcome copyWith({
        int? id,
        String? username,
        String? email,
        String? firstName,
        String? lastName,
        String? gender,
        String? image,
        String? token,
        String? refreshToken,
    }) => 
        Welcome(
            id: id ?? this.id,
            username: username ?? this.username,
            email: email ?? this.email,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            gender: gender ?? this.gender,
            image: image ?? this.image,
            token: token ?? this.token,
            refreshToken: refreshToken ?? this.refreshToken,
        );

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
        token: json["token"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": token,
        "refreshToken": refreshToken,
    };
}
