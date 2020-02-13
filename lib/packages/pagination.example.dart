import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pagination/pagination.dart';

class PaginationHomePage extends StatelessWidget {
  const PaginationHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          body: PaginationList<User>(
//                physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            separatorWidget: Container(
              height: 0.5,
              color: Colors.black,
            ),
            itemBuilder: (BuildContext context, User user) {
              return ListTile(
                title: Text(
                    user.prefix + " " + user.firstName + " " + user.lastName),
                subtitle: Text(user.designation),
                leading: CircleAvatar(
                  child: Text(user.id.toString()),
                ),
                onTap: () => print(user.designation),
                trailing: Icon(
                  Icons.call,
                  color: Colors.green,
                ),
              );
            },
            pageFetch: pageFetch,
            onError: (dynamic error) => Center(
              child: Text('Something Went Wrong'),
            ),
            initialData: <User>[],
            onEmpty: Center(
              child: Text('Empty List'),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<User>> pageFetch(int offset) async {
    final Faker faker = Faker();
    final List<User> upcomingList = List.generate(
      15,
      (int index) => User(
        offset + index,
        faker.person.prefix(),
        faker.person.firstName(),
        faker.person.lastName(),
        faker.company.position(),
      ),
    );
    await Future<List<User>>.delayed(
      Duration(milliseconds: 1500),
    );
    print(1);
    return upcomingList;
  }
}

class User {
  User(this.id, this.prefix, this.firstName, this.lastName, this.designation);

  final int id;
  final String prefix;
  final String firstName;
  final String lastName;
  final String designation;
}
