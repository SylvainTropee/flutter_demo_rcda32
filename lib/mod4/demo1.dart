

void main(){
 
 String hello  = "Hello World !";

 print(hello);

 //typage optionnel
 var age  = 18;
 age = 25;
 //age = "michel"; variable est déjà typé donc ne peut plus changer
 print(age);

 String? name;

print(name?.toUpperCase());

print(name!.toUpperCase());

}