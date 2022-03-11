import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Buffer "mo:base/Buffer";
import Blob "mo:base/Blob";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Prim "mo:⛔";

actor {

  //Day 1
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


  //Day 2
  public func nat_to_nat8(n : Nat) : async Nat8 {
    if (n < 256) {
      return Nat8.fromNat(n);
    };
    return 0;
  };

  public func max_number_with_n_bits(n : Nat) : async Nat {
    return n*255;
  };

  public func decimal_to_bits(n : Nat) : async Text {
    var q : Nat8 = Nat8.fromNat(n);
    var t : Text = "";
    if (n < 256) {
      while (q >= 1) {
        t := Text.concat(t, Nat8.toText(q%2));
        q := q/2;
      };
      return t;
    };
    return "Number must contain max a byte (8 bits) that is 255.";
  };

  public func capitalize_character(c : Char) : async Char {
    return Char.fromNat32(Char.toNat32(c) - 32);
  };

  public func capitalize_text(c : Text) : async Text {
    var arr : [Char] = Iter.toArray(Text.toIter(c));
    var t : Text = "";
    for(a in arr.vals()) {
      t := Text.concat(t, Text.fromChar(Char.fromNat32(Char.toNat32(a) - 32)));
    };
    return t;
  };

  public func is_inside(t : Text, c : Char) : async Bool {
    //Or just use Text.contains.
    var arr : [Char] = Iter.toArray(Text.toIter(t));
    for(a in arr.vals()) {
      if(a == c) {
        return true;
      };
    };
    return false;
  };

  public func trim_whitespace(t : Text) : async Text {
    return Text.trim(t, #text(" "));
  };

  public func duplicated_character(t : Text) : async Text {
    var arr : [Char] = Iter.toArray(Text.toIter(t));
    var te : Text = t;
    var size : Nat = t.size();
    for(a in arr.vals()) {
      te := Text.trim(te, #char(a));
      if(te.size()+2 == size) {
        return Text.fromChar(a);
      };
      size := te.size();
    };
    return t;
  };
  
  public func size_in_bytes(t : Text) : async [Nat8] {
    return Blob.toArray(Text.encodeUtf8(t));
  };

  private func swap( array : [var Text], i: Nat, j: Nat) : [ var Text ] {
    let temp = array[i];
    array[i] := array[j];
    array[j] := temp;

    return array;
  };

  public func init_count( n : Nat) : async [ Nat ] {
    var buff : Buffer.Buffer<Nat> = Buffer.Buffer(n);
    var i : Nat = 0;
    while(i < n) {
      buff.add(i);
      i += 1;
    };

    return buff.toArray();
  };

  public func seven( array : [Nat]) : async Text {
    for(a in array.vals()) {
      for(b in Iter.toArray(Text.toIter(Nat.toText(a))).vals()) {
        if (Text.equal(Char.toText(b), "7")) {
          return "Seven is found";
        };
      };
    };
    return "Seven not found";
  };

  public func nat_opt_to_nat( n : ?Nat, m: Nat) : async Nat {
    switch (n) {
      case (null) { return m };
      case (?a) { return a };
    };
  };

  public func day_of_the_week( n : Nat) : async ?Text {
    switch (n) {
      case (1) { return ?"Monday" };
      case (2) { return ?"Tuesday" };
      case (3) { return ?"Wednesday" };
      case (4) { return ?"Thursday" };
      case (5) { return ?"Friday" };
      case (6) { return ?"Saturday" };
      case (7) { return ?"Sunday" };
      case (_) { return null };
    };
  };

  let f = func (a: ?Nat) : Nat {
    switch(a) {
      case (null) {return 0};
     case (?a) {return a};
    };
  };
  
  public func populate_array( array : [?Nat] ) : async [Nat] {
    return Array.map(array, f);
  };

  public func sum_of_array1( array : [Nat] ) : async Nat {
    var temp : Nat = 0;
    let arr = Array.map<Nat, Nat>(array, 
      func (a: Nat) : Nat {
        temp += a;
        return a;
      }
    );
    return temp;
  };

  public func squared_array( array : [Nat] ) : async [Nat] {
    Array.map<Nat, Nat>(array, 
      func (a: Nat) : Nat {
        return a*2;
      }
    );
  };

  public func increase_by_index( array : [Nat] ) : async [Nat] {
    var i : Nat = 0;
    Array.map<Nat, Nat>(array, 
      func (a: Nat) : Nat {
        let new = a + i;
        i += 1;
        return new;
      }
    );
  };

  
};
