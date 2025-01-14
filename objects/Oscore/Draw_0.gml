var _xx = esp;
var _yy = borda;
var _sep = sep;

//desenhar moedas
draw_text(_xx + 360, _yy + _sep * 0, "moedas"); 
draw_sprite(Scoinicon, 0, _xx + 350, _yy );
draw_text(_xx + 345, _yy + _sep -40, string(global.coin)); 

//desenhar pontos
draw_text(_xx + 365, _yy + _sep - 8, "pontos"); 
draw_sprite(Sscore, 0, _xx + 350, _yy + 40 );
draw_text(_xx + 335, _yy + _sep + 8, string(global.point));