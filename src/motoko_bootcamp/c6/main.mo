import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Buffer "mo:base/Buffer";
import Blob "mo:base/Blob";
import Nat "mo:base/Nat";
import Cycles "mo:base/ExperimentalCycles";
import Nat8 "mo:base/Nat8";
import Result "mo:base/Result";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Prim "mo:⛔";

actor {
    type TokenIndex = Nat;
    type Error = {
        #NotFound;
        #NotAuthorized;
    };

    var registry : HashMap.HashMap<TokenIndex, Principal> = HashMap.HashMap<TokenIndex, Principal>(favouriteNumberEntries.vals(), Principal.equal, Principal.hash);
    var nextTokenIndex : Nat = 0;

    public shared({caller}) func mint () : async Result.Result<Nat, Error> {
        let textCallerId : Text = Principal.toText(caller);

        if(textCallerId == "2vxsx-fae") {
            return #err(#NotAuthorized);
        };
        
        registry.put(nextTokenIndex, caller);
        nextTokenIndex += 1;
        return nextTokenIndex - 1;
    };

    public shared({caller}) func transfer (to : Principal, tokenIndex : Text) : async Result.Result<(), Error> {

        if(Principal.equal(registry.get(tokenIndex),caller)) {
            let l = registry.put(tokenIndex, to);
            return #ok();
        } else {
            #err(#NotAuthorized);
        };

    };

    public query({caller}) func balance () : async [TokenIndex] {
        let buff : Buffer.Buffer<TokenIndex> = Buffer.Buffer(2);
        for ((k,v) in registry.entries()) {
            if(v == caller) {
                buff.add(k);
            }
        };
        return buff.toArray();
    };
};