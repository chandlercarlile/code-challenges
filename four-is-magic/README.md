The challenge this time is to prove that "four is magic"
The input for your program should be any number. (Feel free to set a reasonable limit, for example, <1,000,000)
The challenge is to convert the number into letters. For example:
```ruby
10 -> ten
1457 -> one thousand four hundred fifty seven
```
Then you count the number of letters in the word and that becomes the next number in the series:
```ruby
ten -> 3
one thousand four hundred fifty seven -> 37
```
Repeat this until you come to the inevitable conclusion of "four is magic" because 4->four->4
Show the output of every step. Here's an example, given "10" as the input to the program
```ruby
10 -> ten -> 3
3 -> three -> 5
5 -> five -> 4
4 is magic!
```
