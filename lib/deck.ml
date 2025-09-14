open! Core

type t = Card.t list

let full_deck : t =
  List.fold Card.Suit.all
  ~f:(fun acc suit -> 
    List.map Card.Rank.all ~f:(fun card -> (card, suit))
    |> List.append acc)
  ~init:[]

(* should write an expect test here to see if the full_deck val is as expected *)
