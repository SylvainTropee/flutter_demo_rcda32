void main(){
  //print(getMessage());
  displayMessage(message:  "15");
}

void displayMessage({required String message, int number = 12}){

  print("age = $number");
  print(message);

}


String getMessage(){
  return "Hello World !";
}