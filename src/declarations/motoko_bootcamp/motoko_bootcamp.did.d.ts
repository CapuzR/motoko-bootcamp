import type { Principal } from '@dfinity/principal';
export interface Animal { 'specie' : string, 'energy' : bigint }
export type Energy = bigint;
export interface ForFun { 'name' : string }
export type Specie = string;
export interface _SERVICE {
  'create_animal_then_takes_a_break' : (
      arg_0: Specie,
      arg_1: Energy,
    ) => Promise<Animal>,
  'fun' : () => Promise<ForFun>,
  'push_animal' : (arg_0: Animal) => Promise<undefined>,
}
