import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:syndicate/model.dart/customer.dart';
import 'package:syndicate/model.dart/transaction.dart';

class CustomerDatabase {
  static final CustomerDatabase instance = CustomerDatabase.init();

  static Database? _database;

  CustomerDatabase.init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB('customer.db');
    return _database!;
  }

  Future<Database> initDB(String filePath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filePath);

    return await openDatabase(path, version: 1, onCreate: createDB);
  }

  Future createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    await db.execute('''
CREATE TABLE $tableCustomer(
  ${CustomerFeilds.id} $idType , 
  ${CustomerFeilds.name} $textType  , 
  ${CustomerFeilds.url} $textType , 
  ${CustomerFeilds.phoneNo} $integerType , 
  ${CustomerFeilds.currentBalance} $integerType
)
''');

    await db.execute('''
CREATE TABLE $transactionTable(
  ${TransactionField.id} $idType, 
  ${TransactionField.name} $textType,
  ${TransactionField.url} $textType, 
  ${TransactionField.value} $textType
  )
''');

    Customer c1 = Customer(
        id: 1,
        name: "Emily",
        url: "assets/w1.png",
        currentBalance: 10000,
        phoneNo: 9569696961);
    Customer c2 = Customer(
        id: 2,
        name: "Mittali",
        url: "assets/w2.jpg",
        currentBalance: 10000,
        phoneNo: 9569696961);
    Customer c3 = Customer(
        id: 3,
        name: "Swan",
        url: "assets/m1.png",
        currentBalance: 20000,
        phoneNo: 9876543212);

    Customer c4 = Customer(
        id: 4,
        name: "Eminem",
        url: "assets/m1.png",
        currentBalance: 15000,
        phoneNo: 9876543212);

    Customer c5 = Customer(
        id: 5,
        name: "Hardy",
        url: "assets/m1.png",
        currentBalance: 50000,
        phoneNo: 9569696961);

    Customer c6 = Customer(
        id: 6,
        name: "Thomas",
        url: "assets/m1.png",
        currentBalance: 670000,
        phoneNo: 9876543212);
    Customer c7 = Customer(
        id: 7,
        name: "Alexandra",
        url: "assets/w2.jpg",
        currentBalance: 12000,
        phoneNo: 9569696961);
    Customer c8 = Customer(
        id: 8,
        name: "Scarlett",
        url: "assets/w1.png",
        currentBalance: 118000,
        phoneNo: 9876543212);
    Customer c9 = Customer(
        id: 9,
        name: "Chris",
        url: "assets/m1.png",
        currentBalance: 560000,
        phoneNo: 9027948972);
    Customer c10 = Customer(
        id: 10,
        name: "Strange",
        url: "assets/w1.png",
        currentBalance: 10000,
        phoneNo: 9569696961);
    await db.insert(tableCustomer, c1.toJson());
    await db.insert(tableCustomer, c2.toJson());
    await db.insert(tableCustomer, c3.toJson());
    await db.insert(tableCustomer, c4.toJson());
    await db.insert(tableCustomer, c5.toJson());
    await db.insert(tableCustomer, c6.toJson());
    await db.insert(tableCustomer, c7.toJson());
    await db.insert(tableCustomer, c8.toJson());
    await db.insert(tableCustomer, c9.toJson());
    await db.insert(tableCustomer, c10.toJson());
  }

  Future<List<Customer>> readAllData() async {
    final db = await instance.database;
    final result = await db.query(tableCustomer);
    return result.map((json) => Customer.fromJson(json)).toList();
  }

  Future insertTransaction(TransactionList transaction) async {
    final db = await instance.database;
    await db.insert(transactionTable, transaction.toJson());
  }

  Future<List<TransactionList>> readAllTransactions() async {
    final db = await instance.database;
    final result = await db.query(transactionTable);
    if (result.isEmpty) {
      return [];
    } else {
      return result.map((json) => TransactionList.fromJson(json)).toList();
    }
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
