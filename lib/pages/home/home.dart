import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/todo_service.dart';
import 'package:todo/theme.dart';
import 'package:todo/widgets/list_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    handleAddMessage() async {
      await TodoService().addTodo(
        title: titleController.text,
        isChecked: false,
      );

      setState(() {
        titleController.text = '';
        Navigator.pop(context);
      });
    }

    String greeting() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Good Morning';
      }
      if (hour < 17) {
        return 'Good Afternoon';
      }
      return 'Good Evening';
    }

    modalAdd() {
      showDialog(
        context: context,
        builder: (context) => Container(
          child: SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Task',
                  style: headerTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel_rounded,
                    color: blueColor,
                  ),
                ),
              ],
            ),
            children: [
              Divider(),
              Container(
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Type your task',
                    border: InputBorder.none,
                  ),
                  style: primaryTextStyle.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: 8,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: blueColor,
                ),
                child: TextButton(
                  onPressed: handleAddMessage,
                  child: Text(
                    'Add',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget iconStack() {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          color: blueColor,
        ),
        child: Stack(
          children: [
            Positioned(
              top: -15,
              left: -70,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ellipse.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -70,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ellipse.png'),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/profile.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Text(
                    'Welcome Back, Jamaludin!',
                    style: whiteTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Logout',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                      color: primaryColor1,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget clock() {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            width: double.infinity,
            height: 100.0,
            child: AnalogClock(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset.fromDirection(89.5, 5.0),
                    color: Colors.grey,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ), // decoration
              width: 100.0,
              isLive: true,
              hourHandColor: blueColor,
              minuteHandColor: primaryColor3,
              showSecondHand: true,
              numberColor: blueColor,
              showNumbers: true,
              secondHandColor: primaryColor1,
              textScaleFactor: 1.5,
              showTicks: true,
              tickColor: Colors.white,
              showDigitalClock: false,
              // datetime: DateTime.utc(2022, 14, 10),
              useMilitaryTime: true,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(25),
            child: Text(
              greeting(),
              style: headerTextStyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      );
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
          left: 25,
          right: 25,
        ),
        child: Text(
          'Tasks List',
          style: headerTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily Tasks',
                    style: headerTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                  IconButton(
                    onPressed: modalAdd,
                    icon: Icon(
                      Icons.add_circle_outline_rounded,
                      color: blueColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 300,
              child: Scrollbar(
                child: StreamBuilder<List<TodoModel>>(
                  stream: TodoService().getTask(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: snapshot.data!
                              .map((TodoModel todo) => ListTodo(
                                    id: todo.id,
                                    title: todo.title,
                                    isChecked: todo.isChecked,
                                  ))
                              .toList(),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      body: ListView(
        children: [
          iconStack(),
          clock(),
          header(),
          content(),
        ],
      ),
    );
  }
}
