import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Buffer "mo:base/Buffer";
import Blob "mo:base/Blob";
import Nat "mo:base/Nat";
import Cycles "mo:base/ExperimentalCycles";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Prim "mo:⛔";
import Result "mo:base/Result";

actor {
    
    stable var favouriteNumberEntries : [(
        Principal,        // Asset Identifier (path).
        Nat // Asset data.
    )] = [];

    var favouriteNumber : HashMap.HashMap<Principal, Nat> = HashMap.HashMap<Principal, Nat>(favouriteNumberEntries.vals(), Principal.equal, Principal.hash);

    system func preupgrade() {
        favouriteNumberEntries := Iter.toArray(favouriteNumber.entries());
    };

    system func postupgrade() {
        favouriteNumberEntries := [];
    };


  public shared({caller}) func add_favorite_number (n : Nat) {
    favouriteNumber.put(caller, n);
  };
  
  public shared({caller}) func show_favorite_number () : async ?Nat {
    favouriteNumber.get(caller);
  };

  public shared({caller}) func add_favorite_number_1 (n : Nat): async Text {
    switch(favouriteNumber.get(caller)) {
      case (null) { favouriteNumber.put(caller, n); return "You've successfully registered your number" };
      case (_) { return "You've already registered your number" };
    };
  };

  public shared({caller}) func update_favorite_number (n : Nat) {
    favouriteNumber.put(caller, n);
  };

  public shared({caller}) func delete_favorite_number (n : Nat) {
    favouriteNumber.delete(caller);
  };

};