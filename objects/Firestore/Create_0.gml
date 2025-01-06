root = "dados";
listener = FirebaseFirestore(root).Listener();

data = -1;

 if keyboard_check(ord("N")){
 var _doc = json_stringify(
 {
 name: get_string_async("aaa","aa")
 }
 );
 FirebaseFirestore(root).Set(_doc);
 
 
 }