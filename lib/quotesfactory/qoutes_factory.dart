class Model
{
  String? quotes,originator,types;

  Model(this.quotes,this.originator,this.types);

  factory Model.quotes(Map quotes)
  {
    Model m1 = Model(quotes["quotes"],quotes["originator"],quotes["types"]);
    return m1;
  }
}