void wait2SecondsBeforePrint() async{

  print("avant l'attente");
  await Future.delayed(Duration(seconds: 2));
  print("aprés l'attente");
}

Future<String> getAsyncName() async{
  return 'Michel';
}

void main() async{
  wait2SecondsBeforePrint();
  var name = await getAsyncName();
  print(name);
}