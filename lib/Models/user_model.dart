UserModel? userModel;

class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  UserModel({
     this.id,
     this.name,
     this.email,
     this.phone,
  });


  //sending data to firebase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  //getting data from firebase
 factory UserModel.fromMap(map) {
   return UserModel(
     id: map['id'],
     name: map['name'],
     email: map['email'],
     phone: map['phone'],
   );
  }
}
