import 'dart:convert';
/// status : "Success"
/// message : "Get Fetched Customer Details"
/// data : [{"member_id":"2","user_id":"88","plan_id":"0","trainer_id":"0","batch_id":"0","name":"fgrgfgf","email":"","mobile":"9352805438","dob":"","age":"0","address":"fff","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-06-24 08:11:53"},{"member_id":"3","user_id":"89","plan_id":"1","trainer_id":"0","batch_id":"5","name":"fgrgfgfj","email":"","mobile":"9352805439","dob":"01/08/2001","age":"0","address":"fff","gender":"male","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"23/06/2022","userimage":"","created_at":"2022-06-24 08:13:40"},{"member_id":"4","user_id":"90","plan_id":"1","trainer_id":"0","batch_id":"5","name":"fgrgfgfjk","email":"","mobile":"9352805434","dob":"01/08/2001","age":"0","address":"fff","gender":"male","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"23/06/2022","userimage":"","created_at":"2022-06-24 08:17:05"},{"member_id":"5","user_id":"91","plan_id":"1","trainer_id":"0","batch_id":"5","name":"fgrgfgfjky","email":"","mobile":"9352805435","dob":"01/08/2001","age":"0","address":"fff","gender":"Male","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"23/06/2022","userimage":"","created_at":"2022-06-24 08:18:54"},{"member_id":"6","user_id":"92","plan_id":"1","trainer_id":"0","batch_id":"5","name":"fgrgfgfjkyj","email":"","mobile":"9352805431","dob":"01/08/2001","age":"0","address":"fff","gender":"Male","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"23/06/2022","userimage":"","created_at":"2022-06-24 08:21:28"},{"member_id":"7","user_id":"93","plan_id":"0","trainer_id":"0","batch_id":"0","name":"bbbbbbbbbbb","email":"","mobile":"","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-06-24 08:30:55"},{"member_id":"8","user_id":"94","plan_id":"0","trainer_id":"0","batch_id":"0","name":"bbbbbbbbbbbbjbjjj","email":"","mobile":"hxbhrhrn","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-06-24 08:32:58"},{"member_id":"9","user_id":"95","plan_id":"0","trainer_id":"0","batch_id":"0","name":"bbbbbbbbbbbbjbjjjhhrh4hjtj4","email":"","mobile":"hxbhrhrnhhhdhhd","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-06-24 08:34:49"},{"member_id":"10","user_id":"96","plan_id":"0","trainer_id":"0","batch_id":"0","name":"bbbbbbbbbbbbjbjjjhhrh4hjtj4","email":"","mobile":"hxbhrhrnhhhdhhd","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-06-24 08:36:19"},{"member_id":"11","user_id":"97","plan_id":"0","trainer_id":"0","batch_id":"0","name":"bbbbbbbbbbbbjbjjjhhrh4hjtj4nn","email":"","mobile":"hxbhrhrnhhhdhhd","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-06-24 08:36:30"},{"member_id":"12","user_id":"98","plan_id":"0","trainer_id":"0","batch_id":"0","name":"bbbbbbbbbbbbjbjjjhhrh4hjtj4nn","email":"","mobile":"hxbhrhrnhhhdhhd","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-06-24 08:36:37"},{"member_id":"13","user_id":"99","plan_id":"0","trainer_id":"0","batch_id":"0","name":"bbbbbbbbbbbbjbjjjhhrh4hjtj4nn","email":"","mobile":"hxbhrhrnhhhdhhd","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-06-24 08:36:43"},{"member_id":"14","user_id":"100","plan_id":"0","trainer_id":"0","batch_id":"0","name":"rgry","email":"","mobile":"hth5h","dob":"Jun 24, 2022","age":"0","address":"59565959595","gender":"Beginner","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"[Select Batch, Batch No.1, Batch No.2, Batch No.3, Batch No.4, Batch No.5]","userimage":"[Select Plan, Golden Plan, Silver Plan, Diamond plan, Platinum Plan]","created_at":"2022-06-24 09:14:18"},{"member_id":"15","user_id":"101","plan_id":"2000","trainer_id":"0","batch_id":"0","name":"Pavan kumar","email":"","mobile":"ms1792174@ gmai","dob":"Jun 10, 2022","age":"0","address":"9352805438","gender":"Beginner","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"[Select Batch, Batch No.1, Batch No.2, Batch No.3, Batch No.4, Batch No.5]","userimage":"[Select Plan, Golden Plan, Silver Plan, Diamond plan, Platinum Plan]","created_at":"2022-06-24 09:23:56"},{"member_id":"16","user_id":"102","plan_id":"3000","trainer_id":"0","batch_id":"0","name":"Mahendra Saini ","email":"","mobile":"2001mahendrasai","dob":"Jun 21, 2022","age":"0","address":"9982517734","gender":"adbanced","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"[Select Batch, Batch No.1, Batch No.2, Batch No.3, Batch No.4, Batch No.5]","userimage":"[Select Plan, Golden Plan, Silver Plan, Diamond plan, Platinum Plan]","created_at":"2022-06-24 09:31:38"},{"member_id":"17","user_id":"103","plan_id":"5000","trainer_id":"0","batch_id":"0","name":"Fulsingh saini","email":"","mobile":"fulsinghraj@gma","dob":"","age":"0","address":"9672774256","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-06-24 09:48:01"},{"member_id":"18","user_id":"104","plan_id":"0","trainer_id":"0","batch_id":"0","name":" bn,","email":"","mobile":"vgbnm","dob":"cfvhjkl","age":"0","address":"v bn","gender":"dvghbjk","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"bhjmbhj","userimage":" b j","created_at":"2022-06-25 06:46:54"},{"member_id":"19","user_id":"105","plan_id":"0","trainer_id":"0","batch_id":"0","name":"trainer ","email":"trainer@gmail.com","mobile":"6367478675","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-06-28 12:27:57"},{"member_id":"20","user_id":"106","plan_id":"0","trainer_id":"0","batch_id":"0","name":"gjejjffjdjfuh","email":"trainer@gmail.com","mobile":"6359466614","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-06-29 10:52:46"},{"member_id":"21","user_id":"107","plan_id":"0","trainer_id":"0","batch_id":"0","name":"gjdjkes","email":"trainer@gmail.com","mobile":"898989885","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-08 11:56:43"},{"member_id":"22","user_id":"108","plan_id":"0","trainer_id":"0","batch_id":"0","name":"Krishna","email":"krishna@gmail.com","mobile":"9588081187","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-08 12:00:22"},{"member_id":"23","user_id":"109","plan_id":"0","trainer_id":"0","batch_id":"0","name":"gjfjdfkf","email":"fulsinghraj@gmail.com","mobile":"5684568329","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-08 12:06:06"},{"member_id":"24","user_id":"110","plan_id":"0","trainer_id":"0","batch_id":"0","name":"Krishna1","email":"krishna1@gmail.com","mobile":"958808118","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-08 12:08:44"},{"member_id":"25","user_id":"111","plan_id":"0","trainer_id":"0","batch_id":"0","name":"full ","email":"fulsingh@gmail.com","mobile":"1234567890","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-08 12:11:51"},{"member_id":"26","user_id":"112","plan_id":"0","trainer_id":"0","batch_id":"0","name":"fullgd","email":"fulsinh@gmail.com","mobile":"123456789","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-08 12:12:19"},{"member_id":"27","user_id":"113","plan_id":"0","trainer_id":"0","batch_id":"0","name":"teekam","email":"saini@gmail.com","mobile":"9828998733","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-08 04:26:15"},{"member_id":"28","user_id":"114","plan_id":"0","trainer_id":"0","batch_id":"0","name":"laravel ","email":"saini@gmail.com ","mobile":"22333","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-08 04:31:01"},{"member_id":"29","user_id":"115","plan_id":"0","trainer_id":"0","batch_id":"0","name":"trainer@gmail.com","email":"1234","mobile":"2345","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-08 04:43:29"},{"member_id":"30","user_id":"116","plan_id":"0","trainer_id":"0","batch_id":"0","name":"cvhcv","email":"ffggghjkjcgh","mobile":"8698856988886","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-11 09:28:56"},{"member_id":"31","user_id":"117","plan_id":"0","trainer_id":"0","batch_id":"0","name":"bxbckvkh","email":"nccmvvl","mobile":".995569","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-13 10:38:53"},{"member_id":"32","user_id":"118","plan_id":"0","trainer_id":"0","batch_id":"0","name":"bxbckvkhbzbx","email":"nccmvvl","mobile":".995569 8 8","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-13 10:40:39"},{"member_id":"33","user_id":"119","plan_id":"0","trainer_id":"0","batch_id":"0","name":"bxbckvkhbzbxdgh","email":"nccmvvlcfgh","mobile":".995569 8 88664","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-13 10:43:16"},{"member_id":"34","user_id":"120","plan_id":"0","trainer_id":"0","batch_id":"0","name":"bxbckv","email":"nccmv@gmail.com","mobile":".9955","dob":"","age":"0","address":"","gender":"","current_weight":"","current_height":"","goal":"","personal_trainer":"","start_joining":"","userimage":"","created_at":"2022-07-13 10:47:48"}]

GetCustomer getCustomerFromJson(String str) => GetCustomer.fromJson(json.decode(str));
String getCustomerToJson(GetCustomer data) => json.encode(data.toJson());
class GetCustomer {
  GetCustomer({
      String? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetCustomer.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  List<Data>? _data;
GetCustomer copyWith({  String? status,
  String? message,
  List<Data>? data,
}) => GetCustomer(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// member_id : "2"
/// user_id : "88"
/// plan_id : "0"
/// trainer_id : "0"
/// batch_id : "0"
/// name : "fgrgfgf"
/// email : ""
/// mobile : "9352805438"
/// dob : ""
/// age : "0"
/// address : "fff"
/// gender : ""
/// current_weight : ""
/// current_height : ""
/// goal : ""
/// personal_trainer : ""
/// start_joining : ""
/// userimage : ""
/// created_at : "2022-06-24 08:11:53"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? memberId, 
      String? userId, 
      String? planId, 
      String? trainerId, 
      String? batchId, 
      String? name, 
      String? email, 
      String? mobile, 
      String? dob, 
      String? age, 
      String? address, 
      String? gender, 
      String? currentWeight, 
      String? currentHeight, 
      String? goal, 
      String? personalTrainer, 
      String? startJoining, 
      String? userimage, 
      String? createdAt,}){
    _memberId = memberId;
    _userId = userId;
    _planId = planId;
    _trainerId = trainerId;
    _batchId = batchId;
    _name = name;
    _email = email;
    _mobile = mobile;
    _dob = dob;
    _age = age;
    _address = address;
    _gender = gender;
    _currentWeight = currentWeight;
    _currentHeight = currentHeight;
    _goal = goal;
    _personalTrainer = personalTrainer;
    _startJoining = startJoining;
    _userimage = userimage;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _memberId = json['member_id'];
    _userId = json['user_id'];
    _planId = json['plan_id'];
    _trainerId = json['trainer_id'];
    _batchId = json['batch_id'];
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _dob = json['dob'];
    _age = json['age'];
    _address = json['address'];
    _gender = json['gender'];
    _currentWeight = json['current_weight'];
    _currentHeight = json['current_height'];
    _goal = json['goal'];
    _personalTrainer = json['personal_trainer'];
    _startJoining = json['start_joining'];
    _userimage = json['userimage'];
    _createdAt = json['created_at'];
  }
  String? _memberId;
  String? _userId;
  String? _planId;
  String? _trainerId;
  String? _batchId;
  String? _name;
  String? _email;
  String? _mobile;
  String? _dob;
  String? _age;
  String? _address;
  String? _gender;
  String? _currentWeight;
  String? _currentHeight;
  String? _goal;
  String? _personalTrainer;
  String? _startJoining;
  String? _userimage;
  String? _createdAt;
Data copyWith({  String? memberId,
  String? userId,
  String? planId,
  String? trainerId,
  String? batchId,
  String? name,
  String? email,
  String? mobile,
  String? dob,
  String? age,
  String? address,
  String? gender,
  String? currentWeight,
  String? currentHeight,
  String? goal,
  String? personalTrainer,
  String? startJoining,
  String? userimage,
  String? createdAt,
}) => Data(  memberId: memberId ?? _memberId,
  userId: userId ?? _userId,
  planId: planId ?? _planId,
  trainerId: trainerId ?? _trainerId,
  batchId: batchId ?? _batchId,
  name: name ?? _name,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  dob: dob ?? _dob,
  age: age ?? _age,
  address: address ?? _address,
  gender: gender ?? _gender,
  currentWeight: currentWeight ?? _currentWeight,
  currentHeight: currentHeight ?? _currentHeight,
  goal: goal ?? _goal,
  personalTrainer: personalTrainer ?? _personalTrainer,
  startJoining: startJoining ?? _startJoining,
  userimage: userimage ?? _userimage,
  createdAt: createdAt ?? _createdAt,
);
  String? get memberId => _memberId;
  String? get userId => _userId;
  String? get planId => _planId;
  String? get trainerId => _trainerId;
  String? get batchId => _batchId;
  String? get name => _name;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get dob => _dob;
  String? get age => _age;
  String? get address => _address;
  String? get gender => _gender;
  String? get currentWeight => _currentWeight;
  String? get currentHeight => _currentHeight;
  String? get goal => _goal;
  String? get personalTrainer => _personalTrainer;
  String? get startJoining => _startJoining;
  String? get userimage => _userimage;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['member_id'] = _memberId;
    map['user_id'] = _userId;
    map['plan_id'] = _planId;
    map['trainer_id'] = _trainerId;
    map['batch_id'] = _batchId;
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['dob'] = _dob;
    map['age'] = _age;
    map['address'] = _address;
    map['gender'] = _gender;
    map['current_weight'] = _currentWeight;
    map['current_height'] = _currentHeight;
    map['goal'] = _goal;
    map['personal_trainer'] = _personalTrainer;
    map['start_joining'] = _startJoining;
    map['userimage'] = _userimage;
    map['created_at'] = _createdAt;
    return map;
  }

}