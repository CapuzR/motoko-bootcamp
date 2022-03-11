import Types "./custom";
import ATypes "./animal";
import List "mo:base/List";

actor {

    type ForFun = Types.ForFun;

    public func fun () : async ForFun {
       let fF = {
            name = "For fun";
        };
        return fF;
    };

    type Animal = ATypes.Animal1;

    var animal : Animal = { specie = ""; energy = 0; }; 

    type Specie = Text;
    type Energy = Nat;


    public func create_animal_then_takes_a_break (s : Specie, e : Energy) : async Animal {
        return {
            specie = s;
            energy = e;
        };
    };

    let animalList : List.List<Animal> = List.nil();

    public func push_animal (a : Animal) {
        let l = List.push<Animal>(a, animalList);
    };

}