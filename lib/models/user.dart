class Partner{
  final String username;
  final String email;
  final String phone;
  final String type;


  Partner({this.username, this.email, this.phone,this.type});

  //this method turn a map to an object
  Partner.fromMap(Map<String, dynamic> firestore)
      : username = firestore['name'],
        email = firestore['email'],
        phone = firestore['phone'],
        type = firestore['type']
  ;

}
