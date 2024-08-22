class ContactListData {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? dob;

  ContactListData(
      {this.id, this.firstname, this.lastname, this.email, this.dob});

  factory ContactListData.fromJson(Map<String, dynamic> json) =>
      ContactListData(
        id: json['id'] as String?,
        firstname: json['firstName'] as String?,
        lastname: json['lastName'] as String?,
        email: json['email'] as String?,
        dob: json['dob'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'firstName': firstname,
        'lastName': lastname,
        'email': email,
        'dob': dob,
      };
}
