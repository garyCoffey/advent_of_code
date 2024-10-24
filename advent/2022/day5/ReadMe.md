For the problem, see the website [here](https://adventofcode.com/2022/day/5). May require a login. Copying below for ease:

>>>
The expedition can depart as soon as the final supplies have been unloaded from the ships. Supplies are stored in stacks of marked crates, but because the needed supplies are buried under many other crates, the crates need to be rearranged.

The ship has a giant cargo crane capable of moving crates between stacks. To ensure none of the crates get crushed or fall over, the crane operator will rearrange them in a series of carefully-planned steps. After the crates are rearranged, the desired crates will be at the top of each stack.

The Elves don't want to interrupt the crane operator during this delicate procedure, but they forgot to ask her which crate will end up where, and they want to be ready to unload them as soon as possible so they can embark.

They do, however, have a drawing of the starting stacks of crates and the rearrangement procedure (your puzzle input). For example:

    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
In this example, there are three stacks of crates. Stack 1 contains two crates: crate Z is on the bottom, and crate N is on top. Stack 2 contains three crates; from bottom to top, they are crates M, C, and D. Finally, stack 3 contains a single crate, P.

Then, the rearrangement procedure is given. In each step of the procedure, a quantity of crates is moved from one stack to a different stack. In the first step of the above rearrangement procedure, one crate is moved from stack 2 to stack 1, resulting in this configuration:

[D]        
[N] [C]    
[Z] [M] [P]
 1   2   3 
In the second step, three crates are moved from stack 1 to stack 3. Crates are moved one at a time, so the first crate to be moved (D) ends up below the second and third crates:

1x
---
       
[N] [C] [D]    
[Z] [M] [P]
 1   2   3 
---
2x
---
        [N]
    [C] [D]    
[Z] [M] [P]
 1   2   3 
---

        [Z]
        [N]
    [C] [D]
    [M] [P]
 1   2   3
Then, both crates are moved from stack 2 to stack 1. Again, because crates are moved one at a time, crate C ends up below crate M:

        [Z]
        [N]
[M]     [D]
[C]     [P]
 1   2   3
Finally, one crate is moved from stack 1 to stack 2:

        [Z]
        [N]
        [D]
[C] [M] [P]
 1   2   3
The Elves just need to know which crate will end up on top of each stack; in this example, the top crates are C in stack 1, M in stack 2, and Z in stack 3, so you should combine these together and give the Elves the message CMZ.

After the rearrangement procedure completes, what crate ends up on top of each stack?
>>>

>>>
--- Part Two ---
As you watch the crane operator expertly rearrange the crates, you notice the process isn't following your prediction.

Some mud was covering the writing on the side of the crane, and you quickly wipe it away. The crane isn't a CrateMover 9000 - it's a CrateMover 9001.

The CrateMover 9001 is notable for many new and exciting features: air conditioning, leather seats, an extra cup holder, and the ability to pick up and move multiple crates at once.

Again considering the example above, the crates begin in the same configuration:

    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 
Moving a single crate from stack 2 to stack 1 behaves the same as before:

[D]        
[N] [C]    
[Z] [M] [P]
 1   2   3 
However, the action of moving three crates from stack 1 to stack 3 means that those three moved crates stay in the same order, resulting in this new configuration:

        [D]
        [N]
    [C] [Z]
    [M] [P]
 1   2   3
Next, as both crates are moved from stack 2 to stack 1, they retain their order as well:

        [D]
        [N]
[C]     [Z]
[M]     [P]
 1   2   3
Finally, a single crate is still moved from stack 1 to stack 2, but now it's crate C that gets moved:

        [D]
        [N]
        [Z]
[M] [C] [P]
 1   2   3
In this example, the CrateMover 9001 has put the crates in a totally different order: MCD.

Before the rearrangement process finishes, update your simulation so that the Elves know where they should stand to be ready to unload the final supplies. After the rearrangement procedure completes, what crate ends up on top of each stack?
>>>


Troubleshooting Part 1:

``` 
            [J]             [B] [W]
            [T]     [W] [F] [R] [Z]
        [Q] [M]     [J] [R] [W] [H]
    [F] [L] [P]     [R] [N] [Z] [G]
[F] [M] [S] [Q]     [M] [P] [S] [C]
[L] [V] [R] [V] [W] [P] [C] [P] [J]
[M] [Z] [V] [S] [S] [V] [Q] [H] [M]
[W] [B] [H] [F] [L] [F] [J] [V] [B]
 1   2   3   4   5   6   7   8   9 

move 3 from 5 to 7
                        [L]
                        [S]
            [J]         [W] [B] [W]
            [T]     [W] [F] [R] [Z]
        [Q] [M]     [J] [R] [W] [H]
    [F] [L] [P]     [R] [N] [Z] [G]
[F] [M] [S] [Q]     [M] [P] [S] [C]
[L] [V] [R] [V]     [P] [C] [P] [J]
[M] [Z] [V] [S]     [V] [Q] [H] [M]
[W] [B] [H] [F]     [F] [J] [V] [B]
 1   2   3   4   5   6   7   8   9 

FFQJWLBW

move 2 from 8 to 9
                        [L]     [R]
                        [S]     [B]
            [J]         [W]     [W]
            [T]     [W] [F]     [Z]
        [Q] [M]     [J] [R] [W] [H]
    [F] [L] [P]     [R] [N] [Z] [G]
[F] [M] [S] [Q]     [M] [P] [S] [C]
[L] [V] [R] [V]     [P] [C] [P] [J]
[M] [Z] [V] [S]     [V] [Q] [H] [M]
[W] [B] [H] [F]     [F] [J] [V] [B]
 1   2   3   4   5   6   7   8   9 

FFQJWLWR

move 4 from 3 to 5

                        [L]     [R]
                        [S]     [B]
            [J]         [W]     [W]
            [T]     [W] [F]     [Z]
            [M]     [J] [R] [W] [H]
    [F]     [P]     [R] [N] [Z] [G]
[F] [M]     [Q] [R] [M] [P] [S] [C]
[L] [V]     [V] [S] [P] [C] [P] [J]
[M] [Z] [V] [S] [L] [V] [Q] [H] [M]
[W] [B] [H] [F] [Q] [F] [J] [V] [B]
 1   2   3   4   5   6   7   8   9 

FFVJRWLWR

move 2 from 1 to 7

                        [L]
                        [F]
                        [L]     [R]
                        [S]     [B]
            [J]         [W]     [W]
            [T]     [W] [F]     [Z]
            [M]     [J] [R] [W] [H]
    [F]     [P]     [R] [N] [Z] [G]
    [M]     [Q] [R] [M] [P] [S] [C]
    [V]     [V] [S] [P] [C] [P] [J]
[M] [Z] [V] [S] [L] [V] [Q] [H] [M]
[W] [B] [H] [F] [Q] [F] [J] [V] [B]
 1   2   3   4   5   6   7   8   9 

MFVJRWLWR

move 1 from 3 to 6

                        [L]
                        [F]
                        [L]     [R]
                        [S]     [B]
            [J]     [V] [W]     [W]
            [T]     [W] [F]     [Z]
            [M]     [J] [R] [W] [H]
    [F]     [P]     [R] [N] [Z] [G]
    [M]     [Q] [R] [M] [P] [S] [C]
    [V]     [V] [S] [P] [C] [P] [J]
[M] [Z]     [S] [L] [V] [Q] [H] [M]
[W] [B] [H] [F] [Q] [F] [J] [V] [B]
 1   2   3   4   5   6   7   8   9 

MFHJRVLWR

move 2 from 1 to 7
                        [W]
                        [M]
                        [L]
                        [F]
                        [L]     [R]
                        [S]     [B]
            [J]     [V] [W]     [W]
            [T]     [W] [F]     [Z]
            [M]     [J] [R] [W] [H]
    [F]     [P]     [R] [N] [Z] [G]
    [M]     [Q] [R] [M] [P] [S] [C]
    [V]     [V] [S] [P] [C] [P] [J]
    [Z]     [S] [L] [V] [Q] [H] [M]
    [B] [H] [F] [Q] [F] [J] [V] [B]
 1   2   3   4   5   6   7   8   9 

 FHJRVWWR

move 1 from 8 to 7
                        [W]
                        [W]
                        [M]
                        [L]
                        [F]
                        [L]     [R]
                        [S]     [B]
            [J]     [V] [W]     [W]
            [T]     [W] [F]     [Z]
            [M]     [J] [R]     [H]
    [F]     [P]     [R] [N] [Z] [G]
    [M]     [Q] [R] [M] [P] [S] [C]
    [V]     [V] [S] [P] [C] [P] [J]
    [Z]     [S] [L] [V] [Q] [H] [M]
    [B] [H] [F] [Q] [F] [J] [V] [B]
 1   2   3   4   5   6   7   8   9 

FHJRVWZR

move 4 from 2 to 8

                        [W]
                        [W]
                        [M]
                        [L]
                        [F]
                        [L]     [R]
                        [S] [Z] [B]
            [J]     [V] [W] [V] [W]
            [T]     [W] [F] [M] [Z]
            [M]     [J] [R] [F] [H]
            [P]     [R] [N] [Z] [G]
            [Q] [R] [M] [P] [S] [C]
            [V] [S] [P] [C] [P] [J]
            [S] [L] [V] [Q] [H] [M]
    [B] [H] [F] [Q] [F] [J] [V] [B]
 1   2   3   4   5   6   7   8   9 

BHJRVWZR

move 10 from 9 to 1

                        [W]
                        [W]
                        [M]
                        [L]
                        [F]
[B]                     [L]     
[M]                     [S] [Z] 
[J]         [J]     [V] [W] [V] 
[C]         [T]     [W] [F] [M] 
[G]         [M]     [J] [R] [F] 
[H]         [P]     [R] [N] [Z] 
[Z]         [Q] [R] [M] [P] [S] 
[W]         [V] [S] [P] [C] [P] 
[B]         [S] [L] [V] [Q] [H] 
[R] [B] [H] [F] [Q] [F] [J] [V] 
 1   2   3   4   5   6   7   8   9 

 BBHJRVWZ

```


---------------



Troubleshooting Part 2:

``` 
            [J]             [B] [W]
            [T]     [W] [F] [R] [Z]
        [Q] [M]     [J] [R] [W] [H]
    [F] [L] [P]     [R] [N] [Z] [G]
[F] [M] [S] [Q]     [M] [P] [S] [C]
[L] [V] [R] [V] [W] [P] [C] [P] [J]
[M] [Z] [V] [S] [S] [V] [Q] [H] [M]
[W] [B] [H] [F] [L] [F] [J] [V] [B]
 1   2   3   4   5   6   7   8   9 

move 3 from 5 to 7

                        [W]
                        [S]
            [J]         [L] [B] [W]
            [T]     [W] [F] [R] [Z]
        [Q] [M]     [J] [R] [W] [H]
    [F] [L] [P]     [R] [N] [Z] [G]
[F] [M] [S] [Q]     [M] [P] [S] [C]
[L] [V] [R] [V]     [P] [C] [P] [J]
[M] [Z] [V] [S]     [V] [Q] [H] [M]
[W] [B] [H] [F]     [F] [J] [V] [B]
 1   2   3   4   5   6   7   8   9 

FFQJWWBW


```