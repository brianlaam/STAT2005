# Assignment 1
# Q1(a)
seq(10,30,by=2)

# Q1(b)
1:25-rep(seq(0,16, by=4), rep(5,5))

# Q2(a)
roots <- polyroot(c(1,2,3,4,5))
roots

# Q2(b)
mode(roots)

# Q2(c)
roots <- roots[order(Im(roots))]
roots

# Q3(a)
# A row represents the feature of a single card: its suit and its rank
# Suit column is repeating the 4 suits (each for 13 times) to create total 52 cards
# Rank column is repeating the 13 ranks (each for 4 times) to create total 52 cards

deck <- data.frame(
  suit = rep(c("D","C","H","S"), 13),
  # D = ♦ Diamond, C = ♣ Club, H = ♥ Heart, S = ♠ Spade
  rank = rep(2:14, 4)
  # 11 = Jack, 12 = Queen, 13 = King, 14 = Ace
) 

# Q3(b)
hand <- deck[sample(nrow(deck), 5),]
hand

# Q3(c)
is.flush <- length(unique(hand$suit)) == 1

# Q3(d)
min_rank <- min(hand$rank)
is.straight <- all(sort(hand$rank) == seq(min_rank, min_rank+4))|all(sort(hand$rank) == c(2,3,4,5,14))
# hand <- deck[c(1:4, 13),] # For checking only: straight A,2,3,4,5

# Q3(e)
(is.straightflush <- is.flush & is.straight)
(is.flush <- is.flush & !is.straightflush)
(is.straight <- is.straight & !is.straightflush)

# Q4(a)
moves <- data.frame(
  die_1 = sample(1:6, 100, replace=TRUE),
  die_2 = sample(1:6, 100, replace=TRUE)
)
head(moves)

# Q4(b)
moves$step <- moves$die_1 + moves$die_2
moves$total_step <- cumsum(moves$step)
moves$round <- floor(moves$total_step / 40)
moves$side <- floor((moves$total_step %% 40) / 10)
moves$land <- moves$total_step %% 10
head(moves)

# Q4(c)
moves_1000 <- data.frame(
  die_1 = sample(1:6, 1000, replace=TRUE),
  die_2 = sample(1:6, 1000, replace=TRUE)
)

moves_1000$step <- moves_1000$die_1 + moves_1000$die_2
moves_1000$total_steps <- cumsum(moves_1000$step)

both_landed <- sum(moves_1000$total_steps %% 40 == 39) > 0 & sum(moves_1000$total_steps %% 40 == 37) > 0