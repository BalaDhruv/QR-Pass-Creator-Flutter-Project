import 'package:gpass/model/pass.dart';

class AddPassAction {
  final Pass pass;

  AddPassAction(this.pass);
}

class EditPassAction {
  final Pass pass;

  EditPassAction(this.pass);
}

class DeletePassAction {
  final int id;

  DeletePassAction(this.id);
}

class DeleteAllPassesAction {}
