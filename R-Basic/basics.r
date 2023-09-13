# R is a statisical programming language.
# It is used primarily for data analysis and visualization.

# Left facing arrows can be used to assign values
x <- 5

# Common mathematical operations are carried out with 'inflix operators'
# Below are some common ones

"Addition & Subtraction"
5 + 5 # 10
10 - 2 # 8

"Multiplication & Division"
8 * 2 # 16
16 / 4 # 4

"Exponentiation, Modulus, and Integer Division (In order)"
4 ^ 2 # 6
16 %% 10 # 6 | Returns the remainder after division
6 %/% 4 # 1 | Returns the division result without a remainder

"Let's create a vector"
sentence <- c("are", "you", "as", "bored", "as", "I", "am")


sentence # By default, this returns the entire vector
sentence[c(6:7, 4)] # Using subsetting we can return "I am bored"
sentence[7:1] # Returns the vector in reverse order

toupper(sentence) # This manipulates text to be uppercase
# tolower(sentence) also works

# We can use 'paste()' to combine vectors
paste(sentence, collapse = " ") # Collapse sets what we want in between words

summary(sentence)
