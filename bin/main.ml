open! Core

let () =
  let deck = Blackjack.Deck.full_deck in
  List.iter deck ~f:(fun card -> print_s (Blackjack.Card.sexp_of_t card));
  let count = List.length Blackjack.Deck.full_deck in print_endline [%string "there are %{count#Int} cards in the full_deck value"];
  print_endline "here is a shuffled deck: ";
  let shuffled_deck = Blackjack.Deck.shuffle deck in
  List.iter shuffled_deck ~f:(fun card -> print_s (Blackjack.Card.sexp_of_t card))