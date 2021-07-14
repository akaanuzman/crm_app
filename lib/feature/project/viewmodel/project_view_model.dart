import '../model/project_model.dart';
import 'package:mobx/mobx.dart';
import 'package:mysql1/mysql1.dart';

part 'project_view_model.g.dart';

class ProjectViewModel = _ProjectViewModelBase with _$ProjectViewModel;

abstract class _ProjectViewModelBase with Store {
  @observable
  List<ProjectModel> items = [];

  @action
  Future<void> connectDataBase() async {
    var settings = ConnectionSettings(
        host: '192.168.2.136', port: 3306, user: 'root', db: 'sistem');

    var conn = await MySqlConnection.connect(settings);

    fetchList(conn, settings, "11111111");
    fetchList(conn, settings, "Erdocrm0");
    fetchList(conn, settings, "12345678");
    fetchList(conn, settings, "unHUYUzg");
    fetchList(conn, settings, "UlIWoKvj");
    fetchList(conn, settings, "ECjTkJMl");
    fetchList(conn, settings, "fUfq5ci8");
    fetchList(conn, settings, "12312312");
    fetchList(conn, settings, "11112111");
    fetchList(conn, settings, "e9ULUtL7");
    fetchList(conn, settings, "23132321");
    fetchList(conn, settings, "ED8ccpSl");
    fetchList(conn, settings, "OAWidhF2");
    fetchList(conn, settings, "aasdasda");
    fetchList(conn, settings, "MmRYUcZI");
  }

  Future<void> fetchList(MySqlConnection conn, ConnectionSettings settings,
      String accessCode) async {
    var result =
        await conn.query('select * from project where access = "$accessCode"');
    for (var row in result) {
      ProjectModel model = ProjectModel.fromJson(row.fields);
      items.add(model);
    }
  }
}
