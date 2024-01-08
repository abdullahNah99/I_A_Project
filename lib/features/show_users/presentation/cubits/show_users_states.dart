import 'package:i_a_project/features/show_users/data/models/showusersmodel.dart';

abstract class ShowUsersStates{}
final class ShowUsersInitial extends ShowUsersStates{
}
final class ShowUsersChangeColor extends ShowUsersStates{
}
final class ShowUsersLoading extends ShowUsersStates{
}
final class ShowUsersFailure extends ShowUsersStates{
  final String errormessege;

 ShowUsersFailure(this.errormessege);
}
final class ShowUsersSuccess extends ShowUsersStates{
  List<showusersmodel>showusers=[];
  ShowUsersSuccess(this.showusers);
  
}
final class AddUsersSuccess extends ShowUsersStates{

  
}