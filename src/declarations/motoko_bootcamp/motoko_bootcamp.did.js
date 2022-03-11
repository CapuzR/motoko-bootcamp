export const idlFactory = ({ IDL }) => {
  const Specie = IDL.Text;
  const Energy = IDL.Nat;
  const Animal = IDL.Record({ 'specie' : IDL.Text, 'energy' : IDL.Nat });
  const ForFun = IDL.Record({ 'name' : IDL.Text });
  return IDL.Service({
    'create_animal_then_takes_a_break' : IDL.Func(
        [Specie, Energy],
        [Animal],
        [],
      ),
    'fun' : IDL.Func([], [ForFun], []),
    'push_animal' : IDL.Func([Animal], [], ['oneway']),
  });
};
export const init = ({ IDL }) => { return []; };
