### Take a text and divide it up amongst n pieces suitable for a puzzle or so

library(tidyverse)

a <- "Never gonna give you up;Never gonna let you down;Never gonna run around and desert you;Never gonna make you cry;Never gonna say goodbye;Never gonna tell a lie and hurt you"

b <- a %>% as_tibble %>% 
  tidytext::unnest_characters("boom","a", strip_non_alphanum = FALSE) %>% 
  mutate(oddEven = (1:str_length(a)) %% 2) %>% 
  select(boom, oddEven)

b %>% filter(oddEven == 0) %>% 
  pull(boom) %>% paste(collapse = "")

b %>% filter(oddEven == 1) %>% 
  pull(boom) %>% paste(collapse = "")
