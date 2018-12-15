
Data scraping
=============

`house_reps`
------------

The data `house_reps` is a minimally processed version of that on the [Chief Clerk's webpage](https://www.oregonlegislature.gov/chief-clerk).

To re-generate `house_reps`, run the scripts in order:

1.  `01-scrape.Rmd`
2.  `02-parse.Rmd`
3.  `03-clean.Rmd`
4.  `04-patch.Rmd`

`house_reps_regular`
--------------------

`house_reps_regular` is a more processed data set that:

-   only includes *Regular* sessions,
-   after OR became a state, with
-   legislators in the house at the **start** of the session, and
-   their party affiliation at the **start** of the session.

The code to generate `house_reps_regular` is in `05-regular.Rmd`.

Patches
-------

To see the changes made by patches:

``` r
library(daff)
library(tidyverse)
library(here)
```

``` r
clean_csv <- here("data-raw", "chronology-clean.csv")
patched_csv <- here("data-raw", "chronology-patched.csv")

# use same spec to read
spec <- spec_csv(clean_csv)
```

    ## Parsed with column specification:
    ## cols(
    ##   legislator = col_character(),
    ##   role = col_character(),
    ##   district = col_integer(),
    ##   party = col_character(),
    ##   residence = col_character(),
    ##   gender = col_character(),
    ##   desk_number = col_integer(),
    ##   profession = col_character(),
    ##   notes = col_character(),
    ##   session_name = col_character(),
    ##   session_year = col_integer(),
    ##   regular = col_logical()
    ## )

``` r
clean <- read_csv(clean_csv, col_types = spec)
patched <- read_csv(patched_csv, col_types = spec)

diffs <- diff_data(clean, patched, ordered = FALSE)
```

``` r
diff_html <- render_diff(diffs, view = FALSE, fragment = TRUE,
  summary = TRUE)
writeLines(diff_html)
```

<table>
<thead>
<tr class="header">
<th>
@@
</th>
<th>
session\_name
</th>
<th>
legislator
</th>
<th>
district
</th>
<th>
role
</th>
<th>
party
</th>
<th>
residence
</th>
<th>
gender
</th>
<th>
desk\_number
</th>
<th>
profession
</th>
<th>
notes
</th>
<th>
session\_year
</th>
<th>
regular
</th>
</tr>
</thead>
<tbody>
<tr class="gap">
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
</tr>
<tr>
<td>
</td>
<td>
1909 Session
</td>
<td>
Hawley, C. A.
</td>
<td>
11
</td>
<td>
null
</td>
<td>
R
</td>
<td>
McCoy, Polk
</td>
<td>
Male
</td>
<td>
NA
</td>
<td>
null
</td>
<td>
null
</td>
<td>
1909
</td>
<td>
true
</td>
</tr>
<tr class="modify">
<td class="modify">
⇒
</td>
<td>
1909 Session
</td>
<td>
Jones, Benjamin F.
</td>
<td>
12
</td>
<td>
null
</td>
<td class="modify">
F → R
</td>
<td>
Independence, Polk
</td>
<td>
Male
</td>
<td>
NA
</td>
<td>
null
</td>
<td>
null
</td>
<td>
1909
</td>
<td>
true
</td>
</tr>
<tr>
<td>
</td>
<td>
1909 Session
</td>
<td>
Bones, J. W.
</td>
<td>
13
</td>
<td>
null
</td>
<td>
R
</td>
<td>
Carlton, Yamhill
</td>
<td>
Male
</td>
<td>
NA
</td>
<td>
null
</td>
<td>
null
</td>
<td>
1909
</td>
<td>
true
</td>
</tr>
<tr class="gap">
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
</tr>
<tr>
<td>
</td>
<td>
1939 Session
</td>
<td>
Turner, Howard W.
</td>
<td>
26
</td>
<td>
null
</td>
<td>
R
</td>
<td>
Madras, Crook, Jefferson
</td>
<td>
Male
</td>
<td>
58
</td>
<td>
null
</td>
<td>
null
</td>
<td>
1939
</td>
<td>
true
</td>
</tr>
<tr class="modify">
<td class="modify">
⇒
</td>
<td>
1939 Session
</td>
<td>
Grant, A. S.
</td>
<td>
27
</td>
<td>
null
</td>
<td>
D
</td>
<td>
Baker, Baker
</td>
<td class="modify">
NULL → Male
</td>
<td>
28
</td>
<td>
null
</td>
<td>
null
</td>
<td>
1939
</td>
<td>
true
</td>
</tr>
<tr>
<td>
</td>
<td>
1939 Session
</td>
<td>
Hosch, J. F.
</td>
<td>
28
</td>
<td>
null
</td>
<td>
I
</td>
<td>
Bend, Deschutes
</td>
<td>
Male
</td>
<td>
12
</td>
<td>
null
</td>
<td>
null
</td>
<td>
1939
</td>
<td>
true
</td>
</tr>
<tr class="gap">
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
</tr>
<tr>
<td>
</td>
<td>
1965 Session
</td>
<td>
Willits, Howard
</td>
<td>
6
</td>
<td>
null
</td>
<td>
D
</td>
<td>
Portland, Multnomah
</td>
<td>
Male
</td>
<td>
45
</td>
<td>
null
</td>
<td>
null
</td>
<td>
1965
</td>
<td>
true
</td>
</tr>
<tr class="add">
<td>
+++
</td>
<td>
1965 Session
</td>
<td>
Roberts, Betty R.
</td>
<td>
6
</td>
<td>
null
</td>
<td>
D
</td>
<td>
Portland, Multnomah
</td>
<td>
Female
</td>
<td>
NA
</td>
<td>
null
</td>
<td>
null
</td>
<td>
1965
</td>
<td>
true
</td>
</tr>
<tr>
<td>
</td>
<td>
1965 Session
</td>
<td>
Groener, Richard E.
</td>
<td>
7
</td>
<td>
null
</td>
<td>
D
</td>
<td>
Milwaukie, Clackamas
</td>
<td>
Male
</td>
<td>
48
</td>
<td>
null
</td>
<td>
null
</td>
<td>
1965
</td>
<td>
true
</td>
</tr>
<tr class="gap">
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
</tr>
<tr>
<td>
</td>
<td>
1975 Session
</td>
<td>
Byers, Bernard (Bud)
</td>
<td>
37
</td>
<td>
null
</td>
<td>
D
</td>
<td>
Lebanon, Linn
</td>
<td>
Male
</td>
<td>
35
</td>
<td>
null
</td>
<td>
null
</td>
<td>
1975
</td>
<td>
true
</td>
</tr>
<tr class="add">
<td>
+++
</td>
<td>
1975 Session
</td>
<td>
Rijken, Max
</td>
<td>
38
</td>
<td>
null
</td>
<td>
D
</td>
<td>
Newport, Benton, Lane, Lincoln
</td>
<td>
Male
</td>
<td>
NA
</td>
<td>
null
</td>
<td>
null
</td>
<td>
1975
</td>
<td>
true
</td>
</tr>
<tr>
<td>
</td>
<td>
1975 Session
</td>
<td>
Kerans, Grattan
</td>
<td>
39
</td>
<td>
null
</td>
<td>
D
</td>
<td>
Eugene, Lane
</td>
<td>
Male
</td>
<td>
10
</td>
<td>
null
</td>
<td>
null
</td>
<td>
1975
</td>
<td>
true
</td>
</tr>
<tr class="gap">
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
<td>
...
</td>
</tr>
</tbody>
</table>
In interactive use, use this for full color view:

``` r
render_diff(diffs)
```
