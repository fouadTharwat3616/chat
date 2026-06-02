class AppValidator{
 static bool isEmail(String value)=>
      RegExp(r'^[a-z0-9]\w+\w+?(\.\w+){+,}/gi').hasMatch(value);
}