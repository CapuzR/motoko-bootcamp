import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'add' : (arg_0: bigint, arg_1: bigint) => Promise<bigint>,
  'capitalize_character' : (arg_0: number) => Promise<number>,
  'capitalize_text' : (arg_0: string) => Promise<string>,
  'clear_counter' : () => Promise<undefined>,
  'days_to_second' : (arg_0: bigint) => Promise<bigint>,
  'decimal_to_bits' : (arg_0: bigint) => Promise<string>,
  'divide' : (arg_0: bigint, arg_1: bigint) => Promise<boolean>,
  'duplicated_character' : (arg_0: string) => Promise<string>,
  'get_counter' : () => Promise<bigint>,
  'increment_counter' : (arg_0: bigint) => Promise<bigint>,
  'is_even' : (arg_0: bigint) => Promise<boolean>,
  'is_inside' : (arg_0: string, arg_1: number) => Promise<boolean>,
  'max_number_with_n_bits' : (arg_0: bigint) => Promise<bigint>,
  'maximum' : (arg_0: Array<bigint>) => Promise<bigint>,
  'nat_to_nat8' : (arg_0: bigint) => Promise<number>,
  'remove_from_array' : (arg_0: Array<bigint>, arg_1: bigint) => Promise<
      Array<bigint>
    >,
  'selection_sort' : (arg_0: Array<bigint>) => Promise<Array<bigint>>,
  'size_in_bytes' : (arg_0: string) => Promise<Array<number>>,
  'square' : (arg_0: bigint) => Promise<bigint>,
  'sum_of_array' : (arg_0: Array<bigint>) => Promise<bigint>,
  'trim_whitespace' : (arg_0: string) => Promise<string>,
}
