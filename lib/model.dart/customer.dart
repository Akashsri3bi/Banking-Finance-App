final String tableCustomer = 'customer';

class CustomerFeilds {
  static final String id = '_id';
  static final String name = 'name';
  static final String url = 'url';
  static final String currentBalance = 'currentBalance';
  static final String phoneNo = 'phoneno';

  static final List<String> values = [id, name, url, currentBalance, phoneNo];
}

class Customer {
  final int id;
  final String name;
  final String url;
  final int currentBalance;
  final int phoneNo;

  Customer(
      {required this.id,
      required this.name,
      required this.url,
      required this.currentBalance,
      required this.phoneNo});

  Map<String, Object> toJson() => {
        CustomerFeilds.id: id,
        CustomerFeilds.name: name,
        CustomerFeilds.url: url,
        CustomerFeilds.phoneNo: phoneNo,
        CustomerFeilds.currentBalance: currentBalance,
      };

  static Customer fromJson(Map<String, Object?> json) => Customer(
      id: json[CustomerFeilds.id] as int,
      name: json[CustomerFeilds.name] as String,
      url: json[CustomerFeilds.url] as String,
      currentBalance: json[CustomerFeilds.currentBalance] as int,
      phoneNo: json[CustomerFeilds.phoneNo] as int);

  Customer copy(
          {int? id,
          String? name,
          String? url,
          int? currentBalance,
          int? phoneNo}) =>
      Customer(
          id: id ?? this.id,
          name: name ?? this.name,
          url: url ?? this.url,
          currentBalance: currentBalance ?? this.currentBalance,
          phoneNo: phoneNo ?? this.phoneNo);
}
