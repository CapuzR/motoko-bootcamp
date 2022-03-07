export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'add' : IDL.Func([IDL.Nat, IDL.Nat], [IDL.Nat], []),
    'capitalize_character' : IDL.Func([IDL.Nat32], [IDL.Nat32], []),
    'capitalize_text' : IDL.Func([IDL.Text], [IDL.Text], []),
    'clear_counter' : IDL.Func([], [], []),
    'days_to_second' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'decimal_to_bits' : IDL.Func([IDL.Nat], [IDL.Text], []),
    'divide' : IDL.Func([IDL.Nat, IDL.Nat], [IDL.Bool], []),
    'duplicated_character' : IDL.Func([IDL.Text], [IDL.Text], []),
    'get_counter' : IDL.Func([], [IDL.Nat], []),
    'increment_counter' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'is_even' : IDL.Func([IDL.Nat], [IDL.Bool], []),
    'is_inside' : IDL.Func([IDL.Text, IDL.Nat32], [IDL.Bool], []),
    'max_number_with_n_bits' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'maximum' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Nat], []),
    'nat_to_nat8' : IDL.Func([IDL.Nat], [IDL.Nat8], []),
    'remove_from_array' : IDL.Func(
        [IDL.Vec(IDL.Nat), IDL.Nat],
        [IDL.Vec(IDL.Nat)],
        [],
      ),
    'selection_sort' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Vec(IDL.Nat)], []),
    'size_in_bytes' : IDL.Func([IDL.Text], [IDL.Vec(IDL.Nat8)], []),
    'square' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'sum_of_array' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Nat], []),
    'trim_whitespace' : IDL.Func([IDL.Text], [IDL.Text], []),
  });
};
export const init = ({ IDL }) => { return []; };
