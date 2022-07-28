import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import 'package:todo_application/features/utils/blocs/states.dart';
import 'package:todo_application/features/utils/constants/date_differ_styles.dart';

class AppBloc extends Cubit<AppStates> {
  AppBloc() : super(AppInitialState());
  String tableName = 'Todo';
  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);
  late Database database;
  void createDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = p.join(databasePath, 'todo.db');
    openAppDatabase(
      path: path,
    );
    emit(CreateDatabaseState());
    debugPrint('Database Created');
  }

  void openAppDatabase({
    required String path,
  }) async {
    openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        debugPrint('Table Created');
        await database.execute(
            '''CREATE TABLE $tableName (ID INTEGER PRIMARY KEY,title TEXT,date TEXT,starttime TEXT,endtime TEXT,remind TEXT,repeat TEXT,color TEXT,isCompleted INTEGER,isFavorite INTEGER)''').then((value) {
          debugPrint('table created');
          emit(CreateDatabaseState());
        }).catchError((error) {
          debugPrint(error.toString());
        });
      },
      onOpen: (Database db) {
        database = db;
        debugPrint('Open Database');
        getAllData();
        getDatabyDate();
      },
    );
  }

  TextEditingController remindController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  int isCompleted = 0;
  int isFavourite = 0;
  void insertData() {
    if (colorController.text == '0') {
      colorController.text = '0XFF3CAF50';
    } else if (colorController.text == '1') {
      colorController.text = '0XFFEEEEEE';
    } else if (colorController.text == '2') {
      colorController.text = '0XFF000000';
    } else if (colorController.text == '3') {
      colorController.text = '0XFFCE93D8';
    } else if (colorController.text == '4') {
      colorController.text = '0XFF90CAF9';
    }
    debugPrint('color:${colorController.text}');
    debugPrint('Completed:$isCompleted');
    debugPrint('Favourite:$isFavourite');
    database.transaction((txn) async {
      txn.rawInsert('''INSERT INTO $tableName 
          (title,date,starttime,endtime,remind,repeat,color,isCompleted,isFavorite) 
          VALUES(
          "${titleController.text}",
          "${dateController.text}",
          "${startTimeController.text}",
          "${endTimeController.text}",
          "${remindController.text}",
          "${repeatController.text}",
          "${colorController.text}",
          $isCompleted,
          $isFavourite
          )''');
    }).then((value) {
      debugPrint('Data Inserted');
      titleController.clear();
      dateController.clear();
      startTimeController.clear();
      endTimeController.clear();
      remindController.clear();
      repeatController.clear();
      colorController.clear();
      getAllData();
      emit(InsertTaskState());
    });
  }

  void updateData(@required int incomplete, @required int id) async {
    database.rawUpdate(
      'UPDATE $tableName SET isCompleted = ? WHERE ID = ? ',
      [incomplete, id],
    ).then((value) {
      emit(UpdateTaskState());
      getAllData();
    });
  }

  void UpdateToFavData(@required int isFavourite, @required int id) async {
    database.rawUpdate(
      'UPDATE $tableName SET isFavorite = ? WHERE ID = ? ',
      [isFavourite, id],
    ).then((value) {
      emit(UpdateFavTaskState());
      getAllData();
    });
  }

  List<Map> alltodo = [];
  List<Map> completedtodo = [];
  List<Map> uncompletedtodo = [];

  void getAllData() async {
    alltodo = [];
    uncompletedtodo = [];
    completedtodo = [];
    favouritetodo = [];
    emit(OnLoadingState());
    await database.rawQuery('SELECT * FROM $tableName').then(
      (value) {
        debugPrint('get tasks');
        alltodo = value;
        debugPrint('$alltodo');
        for (var element in value) {
          if (element['isCompleted'] == 1) {
            completedtodo.add(element);
          } else if (element['isCompleted'] == 0) {
            uncompletedtodo.add(element);
          } else {
            alltodo.add(element);
          }
        }
        debugPrint('Data Showed');
        emit(GetTaskState());
      },
    );
  }

  /*void getCompletedlData() async {
    emit(OnLoadingState());
    await database
        .rawQuery('SELECT * FROM $tableName WHERE isCompleted= 1')
        .then(
      (value) {
        debugPrint('get tasks');
        completedtodo = value;
        debugPrint('$completedtodo');
        //for (var element in value) {}
        debugPrint('Data Showed');
        emit(GetTaskState());
      },
    );
  }*/

  /*void getUncompletedlData() async {
    emit(OnLoadingState());
    await database
        .rawQuery('SELECT * FROM $tableName WHERE isCompleted= 0')
        .then(
      (value) {
        debugPrint('get tasks');
        uncompletedtodo = value;
        debugPrint('$uncompletedtodo');
        //for (var element in value) {}
        debugPrint('Data Showed');
        emit(GetTaskState());
      },
    );
  }*/
  List<Map> favouritetodo = [];
  void getFavouriteData() async {
    favouritetodo = [];
    emit(OnLoadingState());
    await database
        .rawQuery('SELECT * FROM $tableName WHERE isFavorite= 1')
        .then(
      (value) {
        debugPrint('get tasks');
        favouritetodo = value;
        debugPrint('$favouritetodo');
        //for (var element in value) {}
        debugPrint('Data Showed');
        emit(GetTaskState());
      },
    );
  }

  void removeData(int id) async {
    database.rawDelete(
      'DELETE FROM $tableName WHERE ID = ? ',
      [id],
    ).then((value) {
      emit(RemoveTaskState());
      getAllData();
    });
  }

  String date = DateFormat('d-MM-yyyy').format(date_now);
  List<Map> todobyday = [];
  void getDatabyDate() async {
    todobyday = [];
    emit(OnLoadingState());
    await database
        .rawQuery(
            'SELECT * FROM $tableName WHERE date= "$date" AND isCompleted= 0')
        .then(
      (value) {
        debugPrint('get this day tasks');
        todobyday = value;
        debugPrint('Today $todobyday');
        debugPrint('Data Showed');
        emit(GetThisDayTaskState());
        getAllData();
      },
    );
  }
}
