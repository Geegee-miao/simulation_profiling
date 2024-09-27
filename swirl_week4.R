## Swirl Week 4

## Lesson 1: Looking at Data


| Whenever you're working with a new dataset, the first thing you should do is look at it! What
| is the format of the data? What are the dimensions? What are the variable names? How are the
| variables stored? Are there missing data? Are there any flaws in the data?

...

  |===                                                                                   |   4%
| This lesson will teach you how to answer these questions and more using R's built-in
| functions. We'll be using a dataset constructed from the United States Department of
| Agriculture's PLANTS Database (http://plants.usda.gov/adv_search.html).

...

|=======                                                                               |   8%
| I've stored the data for you in a variable called plants. Type ls() to list the variables in
| your workspace, among which should be plants.

> ls()
[1] "e"               "hilbert"         "i"               "n"               "plants"         
[6] "r"               "sample.interval" "x"               "y"   

Let's begin by checking the class of the plants variable with class(plants). This will give
| us a clue as to the overall structure of the data.

> class(plants)
[1] "data.frame"

| You got it right!
    
    |==============                                                                        |  16%
| It's very common for data to be stored in a data frame. It is the default class for data read
| into R using functions like read.csv() and read.table(), which you'll learn about in another
| lesson.

...

|=================                                                                     |  20%
| Since the dataset is stored in a data frame, we know it is rectangular. In other words, it
| has two dimensions (rows and columns) and fits neatly into a table or spreadsheet. Use
| dim(plants) to see exactly how many rows and columns we're dealing with.

> dim(plants)
[1] 5166   10

| You're the best!
    
    |=====================                                                                 |  24%
| The first number you see (5166) is the number of rows (observations) and the second number
| (10) is the number of columns (variables).

...

|========================                                                              |  28%
| You can also use nrow(plants) to see only the number of rows. Try it out.

> nrow(plants)
[1] 5166

    
    |============================                                                          |  32%
| ... And ncol(plants) to see only the number of columns.

> ncol(plants)
[1] 10


  |===============================                                                       |  36%
| If you are curious as to how much space the dataset is occupying in memory, you can use
| object.size(plants).

> object.size(plants)
745944 bytes


  |==================================                                                    |  40%
| Now that we have a sense of the shape and size of the dataset, let's get a feel for what's
| inside. names(plants) will return a character vector of column (i.e. variable) names. Give it
| a shot.

> names(plants)
[1] "Scientific_Name"      "Duration"             "Active_Growth_Period" "Foliage_Color"       
[5] "pH_Min"               "pH_Max"               "Precip_Min"           "Precip_Max"          
[9] "Shade_Tolerance"      "Temp_Min_F" 


We've applied fairly descriptive variable names to this dataset, but that won't always be the
| case. A logical next step is to peek at the actual data. However, our dataset contains over
| 5000 observations (rows), so it's impractical to view the whole thing all at once.

...

  |=========================================                                             |  48%
| The head() function allows you to preview the top of the dataset. Give it a try with only one
| argument.

> head(plants)
               Scientific_Name          Duration Active_Growth_Period Foliage_Color pH_Min
1                  Abelmoschus              <NA>                 <NA>          <NA>     NA
2       Abelmoschus esculentus Annual, Perennial                 <NA>          <NA>     NA
3                        Abies              <NA>                 <NA>          <NA>     NA
4               Abies balsamea         Perennial    Spring and Summer         Green      4
5 Abies balsamea var. balsamea         Perennial                 <NA>          <NA>     NA
6                     Abutilon              <NA>                 <NA>          <NA>     NA
  pH_Max Precip_Min Precip_Max Shade_Tolerance Temp_Min_F
1     NA         NA         NA            <NA>         NA
2     NA         NA         NA            <NA>         NA
3     NA         NA         NA            <NA>         NA
4      6         13         60        Tolerant        -43
5     NA         NA         NA            <NA>         NA
6     NA         NA         NA            <NA>         NA

 |================================================                                      |  56%
| By default, head() shows you the first six rows of the data. You can alter this behavior by
| passing as a second argument the number of rows you'd like to view. Use head() to preview the
| first 10 rows of plants.

> head(plants, 10)
Scientific_Name          Duration Active_Growth_Period Foliage_Color
1                        Abelmoschus              <NA>                 <NA>          <NA>
    2             Abelmoschus esculentus Annual, Perennial                 <NA>          <NA>
    3                              Abies              <NA>                 <NA>          <NA>
    4                     Abies balsamea         Perennial    Spring and Summer         Green
5       Abies balsamea var. balsamea         Perennial                 <NA>          <NA>
    6                           Abutilon              <NA>                 <NA>          <NA>
    7               Abutilon theophrasti            Annual                 <NA>          <NA>
    8                             Acacia              <NA>                 <NA>          <NA>
    9                  Acacia constricta         Perennial    Spring and Summer         Green
10 Acacia constricta var. constricta         Perennial                 <NA>          <NA>
    pH_Min pH_Max Precip_Min Precip_Max Shade_Tolerance Temp_Min_F
1      NA     NA         NA         NA            <NA>         NA
2      NA     NA         NA         NA            <NA>         NA
3      NA     NA         NA         NA            <NA>         NA
4       4    6.0         13         60        Tolerant        -43
5      NA     NA         NA         NA            <NA>         NA
6      NA     NA         NA         NA            <NA>         NA
7      NA     NA         NA         NA            <NA>         NA
8      NA     NA         NA         NA            <NA>         NA
9       7    8.5          4         20      Intolerant        -13
10     NA     NA         NA         NA            <NA>         NA

|====================================================                                  |  60%
| The same applies for using tail() to preview the end of the dataset. Use tail() to view the
| last 15 rows.

> tail(plants, 15)
Scientific_Name  Duration Active_Growth_Period Foliage_Color pH_Min
5152                          Zizania      <NA>                 <NA>          <NA>     NA
5153                 Zizania aquatica    Annual               Spring         Green    6.4
5154   Zizania aquatica var. aquatica    Annual                 <NA>          <NA>     NA
5155                Zizania palustris    Annual                 <NA>          <NA>     NA
5156 Zizania palustris var. palustris    Annual                 <NA>          <NA>     NA
5157                      Zizaniopsis      <NA>                 <NA>          <NA>     NA
5158             Zizaniopsis miliacea Perennial    Spring and Summer         Green    4.3
5159                            Zizia      <NA>                 <NA>          <NA>     NA
5160                     Zizia aptera Perennial                 <NA>          <NA>     NA
5161                      Zizia aurea Perennial                 <NA>          <NA>     NA
5162                 Zizia trifoliata Perennial                 <NA>          <NA>     NA
5163                          Zostera      <NA>                 <NA>          <NA>     NA
5164                   Zostera marina Perennial                 <NA>          <NA>     NA
5165                           Zoysia      <NA>                 <NA>          <NA>     NA
5166                  Zoysia japonica Perennial                 <NA>          <NA>     NA
pH_Max Precip_Min Precip_Max Shade_Tolerance Temp_Min_F
5152     NA         NA         NA            <NA>         NA
5153    7.4         30         50      Intolerant         32
5154     NA         NA         NA            <NA>         NA
5155     NA         NA         NA            <NA>         NA
5156     NA         NA         NA            <NA>         NA
5157     NA         NA         NA            <NA>         NA
5158    9.0         35         70      Intolerant         12
5159     NA         NA         NA            <NA>         NA
5160     NA         NA         NA            <NA>         NA
5161     NA         NA         NA            <NA>         NA
5162     NA         NA         NA            <NA>         NA
5163     NA         NA         NA            <NA>         NA
5164     NA         NA         NA            <NA>         NA
5165     NA         NA         NA            <NA>         NA
5166     NA         NA         NA            <NA>         NA


|=======================================================                               |  64%
| After previewing the top and bottom of the data, you probably noticed lots of NAs, which are
| R's placeholders for missing values. Use summary(plants) to get a better feel for how each
| variable is distributed and how much of the dataset is missing.

> summary(plants)
 Scientific_Name      Duration         Active_Growth_Period Foliage_Color          pH_Min     
 Length:5166        Length:5166        Length:5166          Length:5166        Min.   :3.000  
 Class :character   Class :character   Class :character     Class :character   1st Qu.:4.500  
 Mode  :character   Mode  :character   Mode  :character     Mode  :character   Median :5.000  
                                                                               Mean   :4.997  
                                                                               3rd Qu.:5.500  
                                                                               Max.   :7.000  
                                                                               NA's   :4327   
pH_Max         Precip_Min      Precip_Max     Shade_Tolerance      Temp_Min_F    
Min.   : 5.100   Min.   : 4.00   Min.   : 16.00   Length:5166        Min.   :-79.00  
1st Qu.: 7.000   1st Qu.:16.75   1st Qu.: 55.00   Class :character   1st Qu.:-38.00  
Median : 7.300   Median :28.00   Median : 60.00   Mode  :character   Median :-33.00  
Mean   : 7.344   Mean   :25.57   Mean   : 58.73                      Mean   :-22.53  
3rd Qu.: 7.800   3rd Qu.:32.00   3rd Qu.: 60.00                      3rd Qu.:-18.00  
Max.   :10.000   Max.   :60.00   Max.   :200.00                      Max.   : 52.00  
NA's   :4327     NA's   :4338    NA's   :4338                        NA's   :4328    


|==========================================================                            |  68%
| summary() provides different output for each variable, depending on its class. For numeric
| data such as Precip_Min, summary() displays the minimum, 1st quartile, median, mean, 3rd
| quartile, and maximum. These values help us understand how the data are distributed.

|==============================================================                        |  72%
| For categorical variables (called 'factor' variables in R), summary() displays the number of
| times each value (or 'level') occurs in the data. For example, each value of Scientific_Name
| only appears once, since it is unique to a specific plant. In contrast, the summary for
| Duration (also a factor variable) tells us that our dataset contains 3031 Perennial plants,
| 682 Annual plants, etc.


|=================================================================                     |  76%
| You can see that R truncated the summary for Active_Growth_Period by including a catch-all
| category called 'Other'. Since it is a categorical/factor variable, we can see how many times
| each value actually occurs in the data with table(plants$Active_Growth_Period).

> table(plants$Active_Growth_Period)

Fall, Winter and Spring                  Spring         Spring and Fall       Spring and Summer 
15                     144                      10                     447 
Spring, Summer, Fall                  Summer         Summer and Fall              Year Round 
95                      92                      24                       5 


|========================================================================              |  84%
| Perhaps the most useful and concise function for understanding the *str*ucture of your data
| is str(). Give it a try now.

> str(plants)
'data.frame':	5166 obs. of  10 variables:
    $ Scientific_Name     : chr  "Abelmoschus" "Abelmoschus esculentus" "Abies" "Abies balsamea" ...
$ Duration            : chr  NA "Annual, Perennial" NA "Perennial" ...
$ Active_Growth_Period: chr  NA NA NA "Spring and Summer" ...
$ Foliage_Color       : chr  NA NA NA "Green" ...
$ pH_Min              : num  NA NA NA 4 NA NA NA NA 7 NA ...
$ pH_Max              : num  NA NA NA 6 NA NA NA NA 8.5 NA ...
$ Precip_Min          : int  NA NA NA 13 NA NA NA NA 4 NA ...
$ Precip_Max          : int  NA NA NA 60 NA NA NA NA 20 NA ...
$ Shade_Tolerance     : chr  NA NA NA "Tolerant" ...
$ Temp_Min_F          : int  NA NA NA -43 NA NA NA NA -13 NA ...



|============================================================================          |  88%
| The beauty of str() is that it combines many of the features of the other functions you've
| already seen, all in a concise and readable format. At the very top, it tells us that the
| class of plants is 'data.frame' and that it has 5166 observations and 10 variables. It then
| gives us the name and class of each variable, as well as a preview of its contents.

...

  |===============================================================================       |  92%
| str() is actually a very general function that you can use on most objects in R. Any time you
| want to understand the structure of something (a dataset, function, etc.), str() is a good
| place to start.

...

## Lesson 2: Simulation


| One of the great advantages of using a statistical programming language like R is its vast
| collection of tools for simulating random numbers.

...

  |===                                                                                   |   3%
| This lesson assumes familiarity with a few common probability distributions, but these topics
| will only be discussed with respect to random number generation. Even if you have no prior
| experience with these concepts, you should be able to complete the lesson and understand the
| main ideas.

...

  |=====                                                                                 |   6%
| The first function we'll use to generate random numbers is sample().


|========                                                                              |   9%
| Let's simulate rolling four six-sided dice: sample(1:6, 4, replace = TRUE).

> sample(1:6, 4, replace = TRUE)
[1] 3 6 3 2

  |==========                                                                            |  12%
| Now repeat the command to see how your result differs. (The probability of rolling the exact
| same result is (1/6)^4 = 0.00077, which is pretty small!)

> sample(1:6, 4, replace = TRUE)
[1] 6 5 1 1

 |=============                                                                         |  15%
| sample(1:6, 4, replace = TRUE) instructs R to randomly select four numbers between 1 and 6,
| WITH replacement. Sampling with replacement simply means that each number is "replaced" after
| it is selected, so that the same number can show up more than once. This is what we want
| here, since what you roll on one die shouldn't affect what you roll on any of the others.

...

|================                                                                      |  18%
| Now sample 10 numbers between 1 and 20, WITHOUT replacement. To sample without replacement,
| simply leave off the 'replace' argument.

> sample(1:20, 10)
[1] 16 15 14  2 13  4  3  1 18 10


| Since the last command sampled without replacement, no number appears more than once in the
| output.


|=====================                                                                 |  24%
| LETTERS is a predefined variable in R containing a vector of all 26 letters of the English
| alphabet. Take a look at it now.

> LETTERS
[1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W"
[24] "X" "Y" "Z"


|=======================                                                               |  27%
| The sample() function can also be used to permute, or rearrange, the elements of a vector.
| For example, try sample(LETTERS) to permute all 26 letters of the English alphabet.

> sample(LETTERS)
[1] "V" "Y" "R" "C" "Z" "J" "U" "O" "M" "T" "N" "L" "B" "I" "K" "D" "S" "W" "G" "H" "A" "Q" "P"
[24] "F" "X" "E"


|=============================                                                         |  33%
| Now, suppose we want to simulate 100 flips of an unfair two-sided coin. This particular coin
| has a 0.3 probability of landing 'tails' and a 0.7 probability of landing 'heads'.

...

|===============================                                                       |  36%
| Let the value 0 represent tails and the value 1 represent heads. Use sample() to draw a
| sample of size 100 from the vector c(0,1), with replacement. Since the coin is unfair, we
| must attach specific probabilities to the values 0 (tails) and 1 (heads) with a fourth
| argument, prob = c(0.3, 0.7). Assign the result to a new variable called flips.



> flips <- sample(x ,c(0, 1), size = 100, tails = 0, heads = 1, prob = c(0.3, 0.7))
Error in sample(x, c(0, 1), size = 100, tails = 0, heads = 1, prob = c(0.3,  : 
 unused arguments (tails = 0, heads = 1)
                                                                       
> flips <- sample(x, size = 100, replacement = c(0, 1), prob = c(0.3, 0.7))
Error in sample(x, size = 100, replacement = c(0, 1), prob = c(0.3, 0.7)) : 
 unused argument (replacement = c(0, 1))
                                                                      
> flips <- sample(c(0, 1), size = 100, replace = TRUE, prob = c(0.3, 0.7))

| View the contents of the flips variable.

> flips
[1] 1 1 1 1 1 1 1 0 1 0 1 1 1 1 1 0 1 1 1 0 0 1 1 1 0 1 1 0 0 1 0 0 1 0 1 1 0 0 1 0 1 1 1 0 0
[46] 1 1 1 0 0 1 1 1 0 1 0 1 0 1 0 0 1 1 1 1 1 0 1 0 0 0 1 0 1 1 1 0 1 1 1 0 0 1 0 1 1 1 1 1 1
[91] 0 1 0 1 1 0 0 0 0 0


|====================================                                                  |  42%
| Since we set the probability of landing heads on any given flip to be 0.7, we'd expect
| approximately 70 of our coin flips to have the value 1. Count the actual number of 1s
| contained in flips using the sum() function.

> sum(1)
[1] 1

| Not quite right, but keep trying. Or, type info() for more options.

| sum(flips) will add up all the 1s and 0s, giving you the total number of 1s in flips.

> sum(flips)
[1] 61


|=======================================                                               |  45%
| A coin flip is a binary outcome (0 or 1) and we are performing 100 independent trials (coin
| flips), so we can use rbinom() to simulate a binomial random variable.



  |==========================================                                            |  48%
| Each probability distribution in R has an r*** function (for "random"), a d*** function (for
| "density"), a p*** (for "probability"), and q*** (for "quantile"). We are most interested in
| the r*** functions in this lesson, but I encourage you to explore the others on your own.

...

  |============================================                                          |  52%
| A binomial random variable represents the number of 'successes' (heads) in a given number of
| independent 'trials' (coin flips). Therefore, we can generate a single random variable that
| represents the number of heads in 100 flips of our unfair coin using rbinom(1, size = 100,
| prob = 0.7). Note that you only specify the probability of 'success' (heads) and NOT the
| probability of 'failure' (tails). Try it now.


> rbinom(1, size = 100, prob = 0.7)
[1] 71



  |===============================================                                       |  55%
| Equivalently, if we want to see all of the 0s and 1s, we can request 100 observations, each
| of size 1, with success probability of 0.7. Give it a try, assigning the result to a new
| variable called flips2.

> flips2 <- sum(1, size = 100, prob = 0.7)

| Nice try, but that's not exactly what I was hoping for. Try again. Or, type info() for more
| options.

| Call rbinom() with n = 100, size = 1, and prob = 0.7 and assign the result to flips2.

> flips2 <- rbinom(n= 100, size = 1, prob = 0.7)

| All that hard work is paying off!
    
    |==================================================                                    |  58%
| View the contents of flips2.

> flips2
[1] 1 0 1 1 1 0 0 1 1 0 0 1 0 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1 0 0 1 0 1 0 1 1 1 1 0 1 1 1 1 1 1
[46] 0 1 0 1 1 1 1 1 0 1 1 0 0 1 1 0 1 0 1 0 1 1 1 1 1 1 1 1 0 1 1 0 0 1 1 1 1 1 1 1 1 0 1 0 1
[91] 0 0 1 1 1 1 1 1 1 1


|====================================================                                  |  61%
| Now use sum() to count the number of 1s (heads) in flips2. It should be close to 70!
    
    > sum(flips2)
[1] 73


|=========================================================                             |  67%
| The standard normal distribution has mean 0 and standard deviation 1. As you can see under
| the 'Usage' section in the documentation, the default values for the 'mean' and 'sd'
| arguments to rnorm() are 0 and 1, respectively. Thus, rnorm(10) will generate 10 random
| numbers from a standard normal distribution.

Usage
dnorm(x, mean = 0, sd = 1, log = FALSE)
pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
rnorm(n, mean = 0, sd = 1)

Arguments
x, q	vector of quantiles.

p	vector of probabilities.

n	number of observations. If length(n) > 1, the length is taken to be the number required.

mean	vector of means.

sd	vector of standard deviations.

log, log.p	logical; if TRUE, probabilities p are given as log(p).

lower.tail	logical; if TRUE (default), probabilities are 𝑃[𝑋 ≤𝑥]P[X≤x] otherwise, 𝑃[𝑋>𝑥]P[X>x].


Give it a try.

> rnorm(10)
[1]  0.3533307  0.6678279  0.1149836 -0.5080067 -0.9056944  0.3816917  0.9211418  0.2282601
[9] -0.1986146  0.8366827


| Now do the same, except with a mean of 100 and a standard deviation of 25.

> rnorm(10, mean = 100, sd = 25)
[1] 126.38363 123.94862 120.84698  95.76811  89.88916 107.39004  94.20314  88.79804 100.55777
[10] 101.11168


|===============================================================                       |  73%
| Finally, what if we want to simulate 100 *groups* of random numbers, each containing 5 values
| generated from a Poisson distribution with mean 10? Let's start with one group of 5 numbers,
| then I'll show you how to repeat the operation 100 times in a convenient and compact way.

...

|=================================================================                     |  76%
| Generate 5 random values from a Poisson distribution with mean 10. Check out the
| documentation for rpois() if you need help.

> ?rpois
> rpois(5, mean = 10)
Error in rpois(5, mean = 10) : unused argument (mean = 10)

> rpois(5, 10)
[1]  8  8  8  7 15

|====================================================================                  |  79%
| Now use replicate(100, rpois(5, 10)) to perform this operation 100 times. Store the result in
| a new variable called my_pois.

> my_pois <- replicate(100, rpois(5, 10))

> my_pois
[,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13] [,14] [,15] [,16]
[1,]    5    7   14   10   11   12    9    4    7     7     9    13    14     8    14    10
[2,]   11    9   10   13   11   11   14   10   11    16    14    13     9    10     3    15
[3,]    7   14   14   12   10   11   13    6    9     9    11    14    11    10    12     9
[4,]    6    7   13   10   11   15    7    6   13    13    18    11    12    10    11     9
[5,]   12   16    5   13    5   10    9   11    8     6     7     8    15    10     9    10
[,17] [,18] [,19] [,20] [,21] [,22] [,23] [,24] [,25] [,26] [,27] [,28] [,29] [,30] [,31]
[1,]    10     7     8    15    13     5    12     8    16    12     8    19     8     8     8
[2,]     4     7    14     6     8     9    14     9    16    11    11     7     8     9     9
[3,]    14    14    11     9    10    10    13     4     9    10    12     9     8    10    11
[4,]    12    13    14    11    11     8     6    12     7     5     8     5    10     8    10
[5,]    12    12    10    13     6    13    11    15     8    11     7     9     9    10    12
[,32] [,33] [,34] [,35] [,36] [,37] [,38] [,39] [,40] [,41] [,42] [,43] [,44] [,45] [,46]
[1,]    14    10     7    10     7    11    10     6     8     9    13     9    12    11    18
[2,]     2     9     8    11    10     9    13     5    12    10     9     9    10     7    11
[3,]    10    10    13     7     9    10     3    12    15     8    15    11     8    10    10
[4,]    13     7    12     7     8    11     7    12    15    12     8    13    13    10    12
[5,]    12    13    11    13     9    10     9    11     8    12    10    11    10     9    16
[,47] [,48] [,49] [,50] [,51] [,52] [,53] [,54] [,55] [,56] [,57] [,58] [,59] [,60] [,61]
[1,]     3     9     8    14    10    14     7    10    10    11     8     8     9    14     6
[2,]    13     8    10    10     3     8    15     5     7    10    13    11    14     7    11
[3,]    11    12     8    10    12     9     9     7    11     9    10     7    10     6     5
[4,]     5    11    11    14    13     7    12     5    21    11    13    10    14     8     7
[5,]    11    12    11    13    10    15     8    12     7     5    10    17    10    14    16
[,62] [,63] [,64] [,65] [,66] [,67] [,68] [,69] [,70] [,71] [,72] [,73] [,74] [,75] [,76]
[1,]    13     9     9    15    13     6     9     8    11     8    13    16     6    10    12
[2,]     6     8    17    11    10     7    19     8     9    10     2    10     9    12    11
[3,]    12    16    10    10     8    17     9     7    11    11    13    13     7     8    13
[4,]    10     7     6     8     9     4    12    12    10     5     7    13    16     5     5
[5,]    17     8     9     9     8     6     9     7     8    10    13     7     7    16     6
[,77] [,78] [,79] [,80] [,81] [,82] [,83] [,84] [,85] [,86] [,87] [,88] [,89] [,90] [,91]
[1,]     9     8     4     7    15     7    12    11    12    13    14    19     9    13     5
[2,]    11     8     5    14     8     9     9    12    10    13    12     5    14     9    14
[3,]     9    12     6    11    11     7     9    14    12     9    13    10    10     6     7
[4,]    12    12    12    11    13    12    10     6    10     8     7    12    12    14    11
[5,]    12     9     9     9    12     8     6     8    10     9    11    14    10    13     9
[,92] [,93] [,94] [,95] [,96] [,97] [,98] [,99] [,100]
[1,]     8    10     7    10     6     3     9    17      6
[2,]     9     9     6    13    10     5    15    10      7
[3,]    13     9    14    10    13    10     7     9     10
[4,]    18    11     8    10    11     8    13    11     10
[5,]    14    14    10    10    14     7     6     7     13


|=========================================================================             |  85%
| replicate() created a matrix, each column of which contains 5 random numbers generated from a
| Poisson distribution with mean 10. Now we can find the mean of each column in my_pois using
| the colMeans() function. Store the result in a variable called cm.


> cm <- colMeans(my_pois)

|============================================================================          |  88%
| And let's take a look at the distribution of our column means by plotting a histogram with
| hist(cm).

> hist(cm)

|=================================================================================     |  94%
| All of the standard probability distributions are built into R, including exponential
| (rexp()), chi-squared (rchisq()), gamma (rgamma()), .... Well, you see the pattern.


## LESSON 3: BASE GRAPHICS

 |                                                                                      |   0%

| One of the greatest strengths of R, relative to other programming languages, is the ease with
| which we can create publication-quality graphics. In this lesson, you'll learn about base
| graphics in R.

...

|==                                                                                    |   2%
| We do not cover the more advanced portions of graphics in R in this lesson. These include
| lattice, ggplot2 and ggvis.


| Load the included data frame cars with data(cars).

> data(cars)

| You are amazing!
    
    |=======                                                                               |   9%
| To fix ideas, we will work with simple data frames. Our main goal is to introduce various
| plotting functions and their arguments. All the output would look more interesting with
| larger, more complex data sets.


|=============                                                                         |  15%
| Run head() on the cars data.

> head(cars)
speed dist
1     4    2
2     4   10
3     7    4
4     7   22
5     8   16
6     9   10


|===============                                                                       |  17%
| Before plotting, it is always a good idea to get a sense of the data. Key R commands for
| doing so include, dim(), names(), head(), tail() and summary().

...

|=================                                                                     |  20%
| Run the plot() command on the cars data frame.

> plot(cars)

## scatterplot in "Plots"

|===================                                                                   |  22%
| As always, R tries very hard to give you something sensible given the information that you
| have provided to it. First, R notes that the data frame you have given it has just two
| columns, so it assumes that you want to plot one column versus the other.

...

|=====================                                                                 |  24%
| Second, since we do not provide labels for either axis, R uses the names of the columns.
| Third, it creates axis tick marks at nice round numbers and labels them accordingly. Fourth,
| it uses the other defaults supplied in plot().

...

|======================                                                                |  26%
| We will now spend some time exploring plot, but many of the topics covered here will apply to
| most other R graphics functions. Note that 'plot' is short for scatterplot.

|==========================                                                            |  30%
| The help page for plot() highlights the different arguments that the function can take. The
| two most important are x and y, the variables that will be plotted. For the next set of
| questions, include the argument names in your answers. That is, do not type plot(cars$speed,
| cars$dist), although that will work. Instead, use plot(x = cars$speed, y = cars$dist).

...

|============================                                                          |  33%
| Use plot() command to show speed on the x-axis and dist on the y-axis from the cars data
| frame. Use the form of the plot command in which vectors are explicitly passed in as
| arguments for x and y.

> plot(x = cars$speed, y = cars$dist)

|==============================                                                        |  35%
| Note that this produces a slightly different answer than plot(cars). In this case, R is not
| sure what you want to use as the labels on the axes, so it just uses the arguments which you
| pass in, data frame name and dollar signs included.

|==================================                                                    |  39%
| Use plot() command to show dist on the x-axis and speed on the y-axis from the cars data
| frame. This is the opposite of what we did above.

> plot(x = cars$dist, y = cars$speed)
                                                 |  41%
| It probably makes more sense for speed to go on the x-axis since stopping distance is a
| function of speed more than the other way around. So, for the rest of the questions in this
| portion of the lesson, always assign the arguments accordingly.


> plot( x = cars$speed, y = cars$dist, xlab = "Speed")

## 'xlab' : This argument sets the label for the x-axis.

## 'ylab' : This argument sets the label for the y-axis


|=============================================                                         |  52%
| The reason that plots(cars) worked at the beginning of the lesson was that R was smart enough
| to know that the first element (i.e., the first column) in cars should be assigned to the x
| argument and the second element to the y argument. To save on typing, the next set of answers
| will all be of the form, plot(cars, ...) with various arguments added.

...

|===============================================                                       |  54%
| For each question, we will only want one additional argument at a time. Of course, you can
| pass in more than one argument when doing a real project.

...

|=================================================                                     |  57%
| Plot cars with a main title of "My Plot". Note that the argument for the main title is "main"
| not "title".

> plot(cars, main = "My Plot")


| Plot cars with a sub title of "My Plot Subtitle".

> plot(cars, sub = "My Plot Subtitle")


| Plot cars so that the plotted points are colored red. (Use col = 2 to achieve this effect.)

> plot(cars, col = 2)


|========================================================                              |  65%
| Plot cars while limiting the x-axis to 10 through 15.  (Use xlim = c(10, 15) to achieve this effect.)

> plot(cars, xlim = c(10, 15))


|==========================================================                            |  67%
| You can also change the shape of the symbols in the plot. The help page for points (?points)
| provides the details.

...

|============================================================                          |  70%
| Plot cars using triangles.  (Use pch = 2 to achieve this effect.)

> plot(cars, pch = 2)

|==============================================================                        |  72%
| Arguments like "col" and "pch" may not seem very intuitive. And that is because they aren't!
| So, many/most people use more modern packages, like ggplot2, for creating their graphics in
| R.


|================================================================                      |  74%
| It is, however, useful to have an introduction to base graphics because many of the idioms in
| lattice and ggplot2 are modeled on them.

 |===================================================================                   |  78%
| Load the mtcars data frame.

> data(mtcars)

| That's the answer I was looking for.

|=====================================================================                 |  80%
| Anytime that you load up a new data frame, you should explore it before using it. In the
| middle of a swirl lesson, just type play(). This temporarily suspends the lesson (without
| losing the work you have already done) and allows you to issue commands like dim(mtcars) and
| head(mtcars). Once you are done examining the data, just type nxt() and the lesson will pick
| up where it left off.


|=========================================================================             |  85%
| Instead of adding data columns directly as input arguments, as we did with plot(), it is
| often handy to pass in the entire data frame. This is what the "data" argument in boxplot()
| allows.

...

|===========================================================================           |  87%
| boxplot(), like many R functions, also takes a "formula" argument, generally an expression
| with a tilde ("~") which indicates the relationship between the input variables. This allows
| you to enter something like mpg ~ cyl to plot the relationship between cyl (number of
| cylinders) on the x-axis and mpg (miles per gallon) on the y-axis.

|=============================================================================         |  89%
| Use boxplot() with formula = mpg ~ cyl and data = mtcars to create a box plot.

> 
> boxplot(formula = mpg ~ cyl, data = mtcars)

## like scatterplot but represented with a box

|===============================================================================       |  91%
| The plot shows that mpg is much lower for cars with more cylinders. Note that we can use the
| same set of arguments that we explored with plot() above to add axis labels, titles and so
| on


|================================================================================      |  93%
| When looking at a single variable, histograms are a useful tool. hist() is the associated R
| function. Like plot(), hist() is best used by just passing in a single vector.

...

|==================================================================================    |  96%
| Use hist() with the vector mtcars$mpg to create a histogram.

> hist(mtcars$mpg)

## A bar chart appears in "Plots"























