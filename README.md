## BBPLOT

This repo contains the functions of the `bbplot` package, which once installed locally, provides helpful functions for creating and exporting  graphics made in ggplot in the style used by the BBC News data team.

## Installing bbplot

`bbplot` is not on CRAN, so you will have to install it directly from Github using `devtools`. 

If you do not have the `devtools` package installed, you will have to run the first line in the code below as well. 

```
# install.packages('devtools')
devtools::install_github('bbc/bbplot')
```

## Using the functions

The package has two functions for plots: `bbc_style()` and `finalise_plot`.

Detailed examples on how to use the functions included within the `bbplot` package to produce graphics are included in the [R cookbook](https://bbc.github.io/rcookbook/), as well as a more general reference manual for working with `ggplot2`.

A basic explanation and summary here:

### `bbc_style()`

1. `bbc_style()`: has no arguments and is added to the ggplot chain after you have created a plot. What it does is generally makes text size, font and colour, axis lines, axis text and many other standard chart components into BBC style, which has been formulated together with the Visual Journalism design team. 

The function is pretty basic and does not change or adapt based on the type of chart you are making, so in some cases you will need to make additional `theme` arguments in your ggplot chain if you want to make any additions or changes to the style, for example to add or remove gridlines etc. Also note that colours for lines in the case of a line chart or bars for a bar chart, do not come out of the box from the `bbc_style` function, but need to be explicitly set in your other standard `ggplot` chart functions.

Example of how it is used in a standard workflow:

```
line <- ggplot(line_df, aes(x = year, y = lifeExp)) +
geom_line(colour = "#007f7f", size = 1) +
geom_hline(yintercept = 0, size = 1, colour="#333333") +
nhs_style()
```