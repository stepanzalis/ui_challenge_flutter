import 'package:ui_challenges/io/data/person.dart';
import 'package:ui_challenges/menu/menu_item.dart';

class DataHolder {
  var persons = [
    Person('Christian Nelson', 'assets/images/avatars/avatar1.png',
        '17 min ago', 'completed', 'Task name'),
    Person('Martha Ford', 'assets/images/avatars/avatar2.png', '21 min ago',
        'completed', 'Test'),
    Person('Gladys Lawrance', 'assets/images/avatars/avatar3.png', '34 min ago',
        'completed', 'Users'),
    Person('Carl Fletcher', 'assets/images/avatars/avatar4.png', '35 min ago',
        'completed', 'Bussiness'),
    Person('Dave Roberts', 'assets/images/avatars/avatar5.png', '47 min ago',
        'completed', 'HR rel'),
    Person('Hailey Waever', 'assets/images/avatars/avatar6.png', '59 min ago',
        'completed', 'Task to contribute'),
    Person('Super Admin', 'assets/images/avatars/avatar7.png', '2 h ago',
        'completed', 'Admin')
  ];

  var menu = [
    ItemMenu('assets/images/ic_inbox.png', 'Inbox'),
    ItemMenu('assets/images/ic_calendar.png', 'Calendar'),
    ItemMenu('assets/images/ic_projects_done.png', 'Projects'),
    ItemMenu('assets/images/ic_user.png', 'Crew'),
    ItemMenu('assets/images/ic_tag.png', 'Tags'),
    ItemMenu('', ''),
    ItemMenu('assets/images/ic_projects_todo.png', 'Projects'),
  ];
}
