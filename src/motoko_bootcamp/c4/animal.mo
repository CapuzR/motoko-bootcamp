
module {

    public type Animal = {
        var specie: Text;
        var energy: Nat;
    };

    public type Animal1 = {
        specie: Text;
        energy: Nat;
    };
    public func animal_sleep (a : Animal) : Animal {
        a.energy *= 10;
        return a;
    };
};