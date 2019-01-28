import 'package:flutter/material.dart';
import 'package:gpass/model/pass.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PassesList extends StatelessWidget {
  final Pass pass;
  final Function deletePass;

  const PassesList({Key key, this.pass, this.deletePass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10.0),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        color: Color(0xFF444753),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${pass.title.toString()}',
                    style: Theme.of(context).textTheme.title.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    '#${pass.id.toString()}',
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  IconButton(
                    onPressed: () {
                      print('delete');
                      deletePass(pass.id);
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.white,
                  ),
                ],
              ),
              QrImage(
                data: '${pass.data.toString()}',
                foregroundColor: Colors.teal,
                // size: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
