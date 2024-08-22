class ContactListData {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? dob;

  ContactListData(
      {this.id, this.firstname, this.lastname, this.email, this.dob});

  ContactListData.fromJson(Map json)
      : id = json['id'],
        firstname = json['firstName'],
        lastname = json['lastName'],
        email = json['email'] as String?,
        dob = json['dob'] as String?;

  Map toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'dob': dob
    };
  }
}
