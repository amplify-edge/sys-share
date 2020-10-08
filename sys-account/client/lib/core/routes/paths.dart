


class Paths{
  final String baseRoute;
  String login;
  String signup;

  Paths(this.baseRoute) : 
   login = '$baseRoute/login',
   signup = '$baseRoute/signup';
  
}