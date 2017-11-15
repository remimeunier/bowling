# Bowling Scoring Calculator

This mini project can calculate and display the final result of a bowling game from a file, using the official bowling scoring rules.

## Running

To launch the script :

```
  ruby main.rb './path_to_your_file.txt'
```



File format :

```
  Player_name_in_on_worl1 pins_count1
  Player_name_in_on_worl1 pins_count2
  Player_name_in_on_worl2 pins_count1

  etc...
```
Each line represent a throw of one player. You will find some file example in the example directory.


Exemple :

```
  ruby main.rb example/example.txt
```

## Running test

the test are located in the tests folder

for exemple, to run the strike_frame test

```
  ruby ./tests/test_strike_frame.rb
```


## Changing the rules

You can change the rules of the bowling game if you want, in constant.rb file :

```
module Constants
  NUMBER_OF_PINS   = 10
  NUMBER_OF_FRAMES = 10
end
```

