import 'package:quotes/quotesfactory/qoutes_factory.dart';

Global g1 = Global();

class Global
{
  List<Map> my = [
    {'quotes':'Be yourself; everyone else is already taken.','originator':' Oscar Wilde','types':' inspirational'},
    {'quotes':'So many books, so little time','originator':'Frank Zappa','types':' inspirational'},
    {'quotes':'A room without books is like a body without a soul.','originator':'Marcus Tullius Cicero','types':' inspirational'},
    {'quotes':'Pursue what catches your heart, not what catches your eyes','originator':'Roy T. Bennett, The Light in the Heart','types':'Life Lessons Quotes'},
    {'quotes':'Only the dead have seen the end of war.','originator':'Plato','types':'Life Lessons Quotes'}
  ];

  List<Model> quotes=[];

  void generate()
  {
    quotes = my.map((e) => Model.quotes(e)).toList();
  }

}
