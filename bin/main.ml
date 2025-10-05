open! Core

let blackjack_command =
  Command.basic
    (* One player for now. *)
    ~summary:"Start a game of blackjack against a dealer"
    (let%map_open.Command name = flag "name" (required string) ~doc:"STRING name for the player"
     in
     fun () -> Blackjack.play name
    )
;;

let () = Command_unix.run ~version:"0.1" blackjack_command
