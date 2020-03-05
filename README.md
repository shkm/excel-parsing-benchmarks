# Excel Parsing Benchmarks

Benchmarking the speed of reading xlsx files with various Ruby libraries.

## Usage
1. Place an excel file with data in the first sheet in the root directory and name it `sheet.xlsx`
2. `bundle`
3. `./benchmark.sh`.

## Results

Run on a 2018 15-inch MacBook Pro with 2.6GHz 6-Core Intel Core i7, 16 GB 2400MHz memory and MacOS Catalina 10.15.3.

Spreadsheet can be found [here](https://data.overheid.nl/dataset/stichtse-vecht-waterschapsverkiezingen-agv-2019-per-kandidaat), provided by the Dutch "Stichtse Vecht".

Versions: 

- ruby 2.7.0
- rubyXL 3.4.12
- simple_xslx_reader 1.0.4
- creek 2.5.0
- roo 2.8.3
- xsv 0.3.7

```
# rubyxl: Speed

Warming up --------------------------------------
              rubyxl     1.000  i/100ms
Calculating -------------------------------------
              rubyxl      0.120  (± 0.0%) i/s -      8.000  in  66.946044s

# rubyxl: Memory

Calculating -------------------------------------
              rubyxl   934.014M memsize (     1.973M retained)
                        14.413M objects (    20.215k retained)
                        50.000  strings (    50.000  retained)

# simple_xlsx_reader: Speed

Warming up --------------------------------------
  simple_xlsx_reader     1.000  i/100ms
Calculating -------------------------------------
  simple_xlsx_reader      0.257  (± 0.0%) i/s -     16.000  in  62.632245s

# simple_xlsx_reader: Memory

Calculating -------------------------------------
  simple_xlsx_reader   462.283M memsize (   610.039k retained)
                         8.210M objects (     5.383k retained)
                        50.000  strings (    50.000  retained)

# creek: Speed

Warming up --------------------------------------
               creek     1.000  i/100ms
Calculating -------------------------------------
               creek      0.366  (± 0.0%) i/s -     22.000  in  60.210546s

# creek: Memory

Calculating -------------------------------------
               creek   911.538M memsize (   808.237k retained)
                        13.180M objects (     6.099k retained)
                        50.000  strings (    50.000  retained)

# roo: Speed

Warming up --------------------------------------
                 roo     1.000  i/100ms
Calculating -------------------------------------
                 roo      0.285  (± 0.0%) i/s -     18.000  in  63.319667s

# roo: Memory

Calculating -------------------------------------
                 roo   168.783M memsize (     1.327M retained)
                         2.232M objects (    11.058k retained)
                        50.000  strings (    50.000  retained)

# xsv: Speed

Warming up --------------------------------------
                 xsv     1.000  i/100ms
Calculating -------------------------------------
                 xsv      1.447  (± 0.0%) i/s -     87.000  in  60.262783s

# xsv: Memory

Calculating -------------------------------------
                 xsv    80.865M memsize (   361.884k retained)
                       858.294k objects (     3.163k retained)
                        50.000  strings (    50.000  retained)
```
