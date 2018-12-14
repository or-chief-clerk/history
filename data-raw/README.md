
Data scraping
=============

The data come from the [Chief Clerk's webpage](https://www.oregonlegislature.gov/chief-clerk).

To re-generate the data, run the scripts:

1.  `01-scrape.Rmd`
2.  `02-parse.Rmd`
3.  `03-clean.Rmd`
4.  `04-patch.Rmd`

in order.

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
    ##   Legislator = col_character(),
    ##   Role = col_character(),
    ##   District = col_integer(),
    ##   Party = col_character(),
    ##   Residence = col_character(),
    ##   Gender = col_character(),
    ##   `Desk Number` = col_integer(),
    ##   Profession = col_character(),
    ##   Notes = col_character(),
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
Legislator
</th>
<th>
District
</th>
<th>
Role
</th>
<th>
Party
</th>
<th>
Residence
</th>
<th>
Gender
</th>
<th>
Desk Number
</th>
<th>
Profession
</th>
<th>
Notes
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
