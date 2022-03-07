import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Nat "mo:base/Nat";

actor {
  public func add(n : Nat, m : Nat) : async Nat {
    return n+m;
  };

  public func square(n : Nat) : async Nat {
    return n*n;
  };

  public func days_to_second(n : Nat) : async Nat {
    return n*24*60*60;
  };

  var counter = 0;

  public func increment_counter(n : Nat) : async Nat {
    counter += n;
    return counter;
  };

  public func get_counter() : async Nat {
    return counter;
  };
  
  public func clear_counter() : async () {
    counter := 0;
  };

  public func divide(n : Nat, m : Nat) : async Bool {
    return n%m == 0;
  };

  public func is_even(n : Nat) : async Bool {
    return n%2 == 0;
  };

  public func sum_of_array(array : [Nat]) : async Nat {
    var sum = 0;
    for (v in array.vals()) {
      sum += v; 
    };
    return sum;
  };
  
  public func maximum(array : [Nat]) : async Nat {
    return Array.sort(array, Nat.compare)[array.size()-1];
  };

  public func remove_from_array(array : [Nat], n : Nat) : async [Nat] {
    var temp : [Nat] = [];
    for (v in array.vals()) {
      if(v != n) {
        temp := Array.append(temp, [v]);
      };
    };
    return temp;
  };
  
  public func selection_sort(array : [Nat]) : async [Nat] {
    return Array.sort(array, Nat.compare);
  };
};
