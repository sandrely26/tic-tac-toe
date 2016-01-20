Hola a tic tac toe

Ingresa el nombre del primer jugador
>>

Ingresa el nombre del segundo jugador
>>

CARGANDO JUEGO......
TicTacTOe::Game.Start.new

Jugador #{player1.name} Selecciona algun numero del 1..9 para escoger tu casilla
>> 9
Mandar llamar a set_position 9 veces hasta que devulva un true de ganador

TicTacToe.set_position(num)

|1|2|3|
|4|5|6|
|7|8|9|

las posibles sumas de un ganador son 6, 12 15, 18, 24

1 + 2 + 3 = 6
1 + 4 + 7 = 12
1 + 5 + 6 = 12

2 + 1 + 3 = 6
2 + 5 + 8 = 15

3 + 2 + 1 = 6
3 + 6 + 9 = 18
3 + 5 + 7 = 15

4 + 1 + 7 = 12
4 + 5 + 7 = 15

5 + 2 + 8 = 15
5 + 4 + 6 = 15
5 + 1 + 9 = 15

6 + 3 + 9 = 18
6 + 5 + 4 = 15

7 + 8 + 9 = 18
7 + 5 + 3 = 15
7 + 4 + 1 = 12

8 + 7 + 9 = 24
8 + 5 + 2 = 15

9 + 5 + 1 = 15
9 + 6 + 3 = 18
9 + 8 + 7 = 24
