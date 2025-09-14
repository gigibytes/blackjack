open! Core

let () =
Blackjack.Deck.full_deck
|> List.iter ~f:(fun card -> print_s (Blackjack.Card.sexp_of_t card))
