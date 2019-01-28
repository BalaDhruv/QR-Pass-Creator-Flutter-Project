import 'package:flutter/material.dart';
import 'package:gpass/model/pass.dart';

class PassForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final int lastItemId;
  final Function addPass;
  final bool isLoading;

  const PassForm(
      {Key key, this.formKey, this.lastItemId, this.addPass, this.isLoading})
      : super(key: key);

  @override
  _PassFormState createState() => _PassFormState();
}

class _PassFormState extends State<PassForm> {
  String desc;
  String title;
  String data;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidate: false,
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.teal,
            margin: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              bottom: 5.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 5.0,
              ),
              child: TextFormField(
                validator: (String title) =>
                    title.trim().isEmpty ? 'Enter title' : null,
                onSaved: (title) {
                  setState(() {
                    this.title = title;
                  });
                },
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Theme.of(context).textTheme.title.fontSize),
                decoration: inputDecorationWidget(context, 'Title'),
              ),
            ),
          ),
          Card(
            color: Colors.teal,
            margin: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              bottom: 5.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 5.0,
              ),
              child: TextFormField(
                validator: (String desc) =>
                    desc.trim().isEmpty ? 'Enter desc' : null,
                onSaved: (desc) {
                  setState(() {
                    this.desc = desc;
                  });
                },
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Theme.of(context).textTheme.title.fontSize),
                decoration: inputDecorationWidget(context, 'Description'),
              ),
            ),
          ),
          Card(
            color: Colors.teal,
            margin: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              bottom: 5.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 5.0,
              ),
              child: TextFormField(
                validator: (String data) =>
                    data.trim().isEmpty ? 'Enter data' : null,
                onSaved: (data) {
                  setState(() {
                    this.data = data;
                  });
                },
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Theme.of(context).textTheme.title.fontSize),
                decoration: inputDecorationWidget(context, 'Data'),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (widget.formKey.currentState.validate()) {
                widget.formKey.currentState.save();
                Pass pass = Pass(
                  id: widget.lastItemId + 1,
                  title: title,
                  description: desc,
                  data: data,
                );
                widget.addPass(pass);
              } else {
                print('not valid');
              }
            },
            color: Color(0xFF444753),
            child: widget.isLoading
                ? CircularProgressIndicator()
                : Text(
                    'Create Pass',
                    style: TextStyle(color: Colors.white),
                  ),
          ),
        ],
      ),
    );
  }

  InputDecoration inputDecorationWidget(BuildContext context, String label) {
    return InputDecoration(
      labelText: '$label',
      labelStyle: new TextStyle(
        color: Colors.white,
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      border: const UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
      ),
    );
  }
}
