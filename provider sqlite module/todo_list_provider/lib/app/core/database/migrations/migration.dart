/* Esta sera uma interface */
import 'package:sqflite/sqflite.dart';

abstract class Migration {
  //são funções que deverão ser sobrescritas pelas classes filhos
  void create(Batch bacth);
  void update(Batch bacth);
}
