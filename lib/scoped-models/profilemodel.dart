class Note {
  
  String b_firstname,b_lastname,b_address;
Note (this.b_firstname,this.b_lastname,this.b_address);
 Note.fromJson(Map<String, dynamic> json) {
    b_firstname = json['b_firstname'];
    b_lastname = json['b_lastname'];
    b_address = json['b_address'];
    
  }
}