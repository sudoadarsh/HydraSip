import 'package:hydra_sip/base/local_db/as_sqlite/schema_model.dart';

extension DbDataAttrEx on DbDataAttr {
  getAttr() {
    switch (this) {
      case DbDataAttr.primaryKey:
        return 'primary key';
      case DbDataAttr.autoIncrement:
        return 'autoincrement';
      case DbDataAttr.notNull:
        return 'not null';
    }
  }
}