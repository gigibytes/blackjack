open! Core

type t = Card.t list

(* Return a full deck of 52 unique cards *)
let full_deck : t =
  List.fold Card.Suit.all
  ~f:(fun acc suit -> 
    List.map Card.Rank.all ~f:(fun card -> (card, suit))
    |> List.append acc)
  ~init:[]

  let rec shuffle (deck : t) =
    (* maybe: create 52 elem array. Pick from the top of the list and place card in random spot in array. When out of cards (list empty) turn back to list and return. This would be a good shuffle acc to the Computerpphile vid. *)
  ;;
  
  let draw (deck : t) : (Card.t option, t) =
    match deck with
    | [] -> (None, [])
    | [x] -> (Some x, [])
    | x :: xs —> (Some x, xs)
  ;;

(* should write an expect test here to see if the full_deck val is as expected *)
  (* for later: print_s output:
  ((Face King) Hearts)               
  ((Face Queen) Hearts)
  ((Face Jack) Hearts)
  ((Face Ace) Hearts)
  ((Pip Two) Hearts)
  ((Pip Three) Hearts)
  ((Pip Four) Hearts)
  ((Pip Five) Hearts)
  ((Pip Six) Hearts)
  ((Pip Seven) Hearts)
  ((Pip Eight) Hearts)
  ((Pip Nine) Hearts)
  ((Pip Ten) Hearts)
  ((Face King) Diamonds)
  ((Face Queen) Diamonds)
  ((Face Jack) Diamonds)
  ((Face Ace) Diamonds)
  ((Pip Two) Diamonds)
  ((Pip Three) Diamonds)
  ((Pip Four) Diamonds)
  ((Pip Five) Diamonds)
  ((Pip Six) Diamonds)
  ((Pip Seven) Diamonds)
  ((Pip Eight) Diamonds)
  ((Pip Nine) Diamonds)
  ((Pip Ten) Diamonds)
  ((Face King) Spades)
  ((Face Queen) Spades)
  ((Face Jack) Spades)
  ((Face Ace) Spades)
  ((Pip Two) Spades)
  ((Pip Three) Spades)
  ((Pip Four) Spades)
  ((Pip Five) Spades)
  ((Pip Six) Spades)
  ((Pip Seven) Spades)
  ((Pip Eight) Spades)
  ((Pip Nine) Spades)
  ((Pip Ten) Spades)
  ((Face King) Clubs)
  ((Face Queen) Clubs)
  ((Face Jack) Clubs)
  ((Face Ace) Clubs)
  ((Pip Two) Clubs)
  ((Pip Three) Clubs)
  ((Pip Four) Clubs)
  ((Pip Five) Clubs)
  ((Pip Six) Clubs)
  ((Pip Seven) Clubs)
  ((Pip Eight) Clubs)
  ((Pip Nine) Clubs)
  ((Pip Ten) Clubs)
*)