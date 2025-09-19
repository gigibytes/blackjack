type t

(* Player data *)
(* val stack : int *)
val score : t -> int

(* Player actions *)
(* TODO: implement betting *)
val hit : Card.t -> t -> t