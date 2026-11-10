(* Son -- le « bip-bip » de protestation du robot quand on veut le faire
   sortir du cadre (Dessiner, interactionTP).
   Le son (deux bips de 880 Hz, comme bip () de LibRobot) est engendre une
   fois dans un fichier WAV temporaire et joue par afplay (macOS), sans
   attendre : le dessin continue pendant le son. LEROBOT_MUET=1 coupe le
   son ; sans afplay, Graphics.sound (cloche de X11). *)

let fichier = ref None

let wav () =
  match !fichier with
  | Some f -> f
  | None ->
    let taux = 22050 in
    let b = Buffer.create 20000 in
    let bip duree =
      let n = int_of_float (duree *. float_of_int taux) in
      let att = float_of_int taux *. 0.01 in
      for i = 0 to n - 1 do
        let env = min 1. (min (float_of_int i /. att) (float_of_int (n - i) /. att)) in
        let v = 0.5 *. env *. sin (2. *. Float.pi *. 880. *. float_of_int i /. float_of_int taux) in
        Buffer.add_int16_le b (int_of_float (v *. 32000.))
      done in
    let silence duree =
      for _ = 1 to int_of_float (duree *. float_of_int taux) do Buffer.add_int16_le b 0 done in
    bip 0.12; silence 0.08; bip 0.12;
    let n = Buffer.length b / 2 in
    let f = Filename.temp_file "lerobot-bipbip" ".wav" in
    let oc = open_out_bin f in
    let h = Buffer.create 44 in
    let u32 x = Buffer.add_int32_le h (Int32.of_int x) and u16 x = Buffer.add_uint16_le h x in
    Buffer.add_string h "RIFF"; u32 (36 + 2 * n); Buffer.add_string h "WAVE";
    Buffer.add_string h "fmt "; u32 16; u16 1; u16 1; u32 taux; u32 (2 * taux);
    u16 2; u16 16; Buffer.add_string h "data"; u32 (2 * n);
    Buffer.output_buffer oc h; Buffer.output_buffer oc b; close_out oc;
    at_exit (fun () -> try Sys.remove f with _ -> ());
    fichier := Some f; f

(* processus afplay en cours *)
let joueur = ref None

let en_cours () =
  match !joueur with
  | None -> false
  | Some pid ->
    (match Unix.waitpid [Unix.WNOHANG] pid with
     | (0, _) -> true
     | _ -> joueur := None; false
     | exception Unix.Unix_error _ -> joueur := None; false)

let bipbip () =
  if Sys.getenv_opt "LEROBOT_MUET" = None then
    if Sys.file_exists "/usr/bin/afplay" then begin
      (* le bip-bip precedent n'est pas fini : on ne le double pas *)
      if not (en_cours ()) then begin
        let nul = Unix.openfile "/dev/null" [Unix.O_RDWR] 0 in
        let pid = Unix.create_process "/usr/bin/afplay" [| "afplay"; wav () |]
            nul nul nul in
        Unix.close nul;
        joueur := Some pid
      end
    end
    else (try Graphics.sound 880 120 with _ -> ())
