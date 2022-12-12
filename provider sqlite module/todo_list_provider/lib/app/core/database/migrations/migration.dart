/* Esta sera uma interface */
import 'package:sqflite/sqflite.dart';

abstract class Migration {
  void create(Batch bacth);
  void update(Batch bacth);
}
