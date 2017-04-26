# Command-Line Analysis Utils

A collection of simple scripts to help with doing data analysis at the command line.

# Description

`clat` is a collection of scripts that are useful for doing data analysis on
the command line.  For example, there are scripts for calculating the average,
standard deviation, and standard error of the mean.

- `avg`

```
usage: avg [-h] [FILE [FILE ...]]

Calculate the average of column data.

positional arguments:
  FILE        input files. stdin is used if no files are given.

optional arguments:
  -h, --help  show this help message and exit
```
- `hist`

```
usage: hist [-h] [--num-bins NUM_BINS] [FILE [FILE ...]]

Create a histogram for a set of values.

positional arguments:
  FILE                  input files. stdin is used if no files are given.

optional arguments:
  -h, --help            show this help message and exit
  --num-bins NUM_BINS, -n NUM_BINS
                        Sets the number of bins that will be used. If not
                        given, a reasonable bin number is automatically
                        calculated.
```
- `plot`

```
usage: plot [-m] [-r] [-o]

Plot data read from standard input using gnuplot.

optional arguments:
  -h, --help show this help message and exit
  -m, --modifiers STRING appends STRING to the plot command.
  -r, --pre, -r STRING executed commands in STRING before the plot command.
  -o, --post STRING executed commands in STRING after the plot command.


Example:

This script essentailly builds a gnuplot command string that will plot data
from the standard input. For example:

> src/plot -pre "set xrange[0:5]; set yrange[-1.5:1.5]" -pos "set term png; set output 'example.png'; rep" -modifiers "with linespoints title 'data'"

will execute the following command.

gnuplot -persist -e "set xrange[0:5]; set yrange[-1.5:1.5]; plot '-' with linespoints title 'data'; set term png; set output 'example.png'; rep"

which will create a plot that is displayed on the screen and a file named example.png.

```
- `stddev`

```
usage: stddev [-h] [--biased] [FILE [FILE ...]]

Calculate the standard deviation of column data.

positional arguments:
  FILE          input files. stdin is used if no files are given.

optional arguments:
  -h, --help    show this help message and exit
  --biased, -b  use biased estimator (divide by n instead of n - 1)
```
- `sum`

```
usage: sum [-h] [FILE [FILE ...]]

Calculate the sum of column data.

positional arguments:
  FILE        input files. stdin is used if no files are given.

optional arguments:
  -h, --help  show this help message and exit
```
- `unc`

```
usage: unc [-h] [FILE [FILE ...]]

Calculate the uncertainty (standard error of the mean) of column data.

positional arguments:
  FILE        input files. stdin is used if no files are given.

optional arguments:
  -h, --help  show this help message and exit
```

