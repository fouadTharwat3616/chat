import 'package:chat/auth/view_model/user_states.dart';
import 'package:chat/shared/database_utils.dart';
import 'package:chat/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthViewModel extends Cubit<AuthStates>
{
  AuthViewModel() : super(AuthInitial());
  UserModel? currentUser;


  Future<void> register({required String name,required String email,required String password})async
  {
    emit(RegisterLoading());
    try{
      currentUser = await DataBaseUtils.Register(
        name: name,
          email: email,
          password: password
      );
      emit(RegisterSuccess());
    }catch(error)
    {
      emit(RegisterError(error.toString()));
    }
  }

  Future<void> login({required String email,required String password})async
  {
    emit(LoginLoading());
 try{
   currentUser = await DataBaseUtils.Login(
       email: email,
       password: password
   );
   emit(LoginSuccess());
 }catch(error)
    {
      emit(LoginError(error.toString()));
    }
  }

  Future<void> logOut()async{
    emit(LogoutLoading());
    try{
      await DataBaseUtils.LogOut();
      emit(LogoutSuccess());
    }
    catch(error){
      emit(LogoutError(error.toString()));
    }

  }

  Future<void> getCurrentUser()async{
    try{
     currentUser =await DataBaseUtils.getCurrentUser();
     if(currentUser != null)
       {
         emit(IsLoggedIn());
       }
     else
       {
         emit(NotLoggedIn());
       }
    }
    catch(_){
      emit(NotLoggedIn());
        }
  }



}



/*
class UserProvider with ChangeNotifier{
  UserModel? currentUser;


  void UpdateUser(UserModel user)
  {
    currentUser = user;
    notifyListeners();
  }

}
*/