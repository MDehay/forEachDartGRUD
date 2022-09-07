class Dog{

  final String message;
  final String status;

  Dog({required this.message,required this.status});

  Dog.fromJson(Map<String,dynamic> json)
    : message = json["message"],
      status = json["status"];

  Map<String,dynamic> toJson() => {
    'message':message,
    'status':status,
  };
   
}