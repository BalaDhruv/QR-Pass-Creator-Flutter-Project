import 'package:jaguar_orm/jaguar_orm.dart';

class Pass {
  @PrimaryKey(auto: true)
  int id;
  @Column(isNullable: false)
  String title;
  @Column(isNullable: false)
  String desc;
  @Column(isNullable: false)
  String data;

  String toString() => "Pass($id, $title, $desc, $data)";
}
