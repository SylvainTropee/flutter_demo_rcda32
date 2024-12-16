enum ClothType{

  Trouser,
  TShirt,
  Sock


}


class Clothes{

  String color = "";
  ClothType type = ClothType.TShirt;
  int size = 0;



  Clothes(
    {required this.color, required this.type, this.size = 0}
  );

  Clothes.fromJson(Map<String, dynamic> json){
    this.color = json['color'];
    this.type = json['type'];
  }

  String get getColor{
    return this.color;
  }

  set setColor(String color){
    this.color = color;
  }
  

  @override
  String toString() {
   
    return "${this.type.name} est de couleur ${this.color} ${this.size > 0 ? ', taille = ${this.size}' : '' }";
  }

}

void main(){
  Clothes c = Clothes(color: "Bleu", type: ClothType.TShirt);
  print(c.toString());

  c.setColor = "violet";
  print(c.toString());

  Clothes c2 = Clothes.fromJson({"color" : "rouge", "type" : ClothType.Trouser});
  print(c2.toString());
}

