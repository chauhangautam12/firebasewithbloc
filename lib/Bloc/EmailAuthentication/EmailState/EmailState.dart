abstract class EmailState{}
class Initionalstate extends EmailState{}
class ValidState extends EmailState{}
class Invalidstate extends EmailState{}
class errorState extends EmailState{
  final  String error;
  errorState(this.error);
}