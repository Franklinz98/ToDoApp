import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/widgets/dialog.dart';
import 'package:todo_app/widgets/dismissible_background.dart';
import 'package:todo_app/widgets/item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ToDo> todos = new List<ToDo>();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return NewToDoDialog();
        }).then((val) {
          if(val!=null){
            setState(() {
              todos.add(val);
            });
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Expanded(
                        child: Image.asset(
                          'assets/images/header.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/header_icon.png'),
                      new Text(
                        "To Do App",
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            textStyle: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, posicion) {
                  var element = todos[posicion];
                  return Dismissible(
                    // TODO: no estoy seguro de este Key
                    key:UniqueKey(),
                    onDismissed: (direction) {
                      // Remove the item from the data source.
                      setState(() {
                        todos.removeAt(posicion);
                      });
                      // Then show a snackbar.
                      Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('$element.title dismissed')));
                    },
                    //TODO: ToDo listo o no (ONTAP)
                    child: ListItem(todo: element, onPressed: (){
                      setState(() {
                        element.completed=element.completed==0?1:0;
                      });
                    }),
                    background: DismissibleBackground(alignment: -1.0),
                    secondaryBackground: DismissibleBackground(alignment: 1.0),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Add Task',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
