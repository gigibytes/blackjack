open! Core

module Card = Card
module Deck = Deck
module Player = Player

module Game = struct
  let fresh_deck = Deck.full_deck
  let shuffled_deck = Deck.shuffle fresh_deck

  let get_card_and_update_deck deck =
    let new_card, new_deck = Deck.draw deck
    in
    ((Option.value_exn ~message:"Unable to draw a card!" new_card), new_deck)
  ;;

  let new_hand deck =
    let first_card, deck' = get_card_and_update_deck deck
    in
    let second_card, deck'' = get_card_and_update_deck deck'
    in
    [first_card; second_card], deck''
  ;;

  module Flow = struct
    (* init a fresh game and player state. *)
    let new_round player deck = () ;;
    (* start a new round and persist the player state. *)
    let next_round player deck = () ;;
    (* ends the game. *)
    let kick_player player deck = () ;;

    let hit_or_stand player deck =
      let input = print_endline [%string "Hit or stand? h/s"];
    (* TODO implement reading choice  *)
      let choice = match input with
        | 'h' ->
          let new_card, updated_deck = get_card_and_update_deck
          in
          let player = Player.hit ~new_card player
          in
          updated_player, updated_deck
        | 's' -> player, deck
    ;;

    let next action player deck =
      let stack = Player.stack player
      in
      match action with
      | `Player_won ->
        print_endline [%string "You WON this round! Keep playing? Current stack: %{stack#Int}"]; player, deck
      | `Player_lost ->
        (match stack with
         | s when s <= 0 -> print_endline "You're out of chips! Bye."; kick_player player deck
         | _ -> print_endline [%string "You LOST this round! Keep playing? Current stack: %{stack#Int}"]; next_round player deck)
      | `Continue -> hit_or_stand player deck
  end
end

let blackjack name =
  (* TODO loop until someone wins: do i just use a while loop? *)
  (* bonus: keep a leaderboard/store high scores. *)
  print_endline [%string "Hello %{name}! Place a bet."];
  let initial_player_hand, _shuffled_deck = Game.new_hand Game.shuffled_deck
  in
  let player = Player.{ stack = 0; hand = initial_player_hand }
  in
  print_endline "Your hand is:";
  List.iter player.hand ~f:(fun card ->  Card.sexp_of_t card |> print_s);
  let points = Player.score player
  in
  print_endline [%string "You have %{points#Int} points."];
  match points with
  | p when points == 21 -> Game.Flow.next `Player_won
  | p when points > 21 -> Game.Flow.next `Player_lost
  | p when points < 21 -> Game.Flow.next `Continue
;;

