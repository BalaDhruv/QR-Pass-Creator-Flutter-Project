import 'package:flutter/material.dart';
import 'package:gpass/model/pass.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gpass/src/home/widget/form_pass.dart';
import 'package:gpass/src/home/widget/pass_list_widget.dart';
import 'package:gpass/store/actions/pass_action.dart';
import 'package:gpass/store/app_state.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();

  String desc;
  String title;
  String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'gPass',
          style: TextStyle(color: Colors.teal),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: StoreConnector<AppState, _ViewModel>(
          converter: (Store<AppState> store) => _ViewModel.create(store),
          builder: (context, model) {
            return Column(
              children: <Widget>[
                PassForm(
                  formKey: formKey,
                  isLoading: model.isLoading,
                  addPass: model.addPass,
                  lastItemId:
                      model.passes.length == 0 ? 0 : model.passes.last.id,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Your Passes',
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.teal),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: model.passes.map(
                      (pass) {
                        return PassesList(
                          pass: pass,
                          deletePass: model.deletePass,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ViewModel {
  final bool isLoading;
  final List<Pass> passes;
  final Function addPass;
  final Function deletePass;

  _ViewModel(
      {@required this.passes,
      @required this.addPass,
      @required this.deletePass,
      @required this.isLoading});

  factory _ViewModel.create(Store<AppState> store) {
    _addPass(Pass pass) => store.dispatch(AddPassAction(pass));
    _deletePass(int id) => store.dispatch(DeletePassAction(id));

    return _ViewModel(
      isLoading: store.state.passState.isLoading,
      passes: store.state.passState.passes,
      addPass: _addPass,
      deletePass: _deletePass,
    );
  }
}
