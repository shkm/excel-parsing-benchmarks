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
- xsv 0.3.1

```
# rubyXL: Speed

Rehearsal ------------------------------------------
rubyxl   7.777648   0.188772   7.966420 (  7.984582)
--------------------------------- total: 7.966420sec

             user     system      total        real
rubyxl   7.680135   0.137059   7.817194 (  7.824257)

# rubyXL: Memory

Calculating -------------------------------------
              rubyxl   934.014M memsize (     1.974M retained)
                        14.413M objects (    20.223k retained)
                        50.000  strings (    50.000  retained)

# simple_xlsx_reader: Speed

Rehearsal ------------------------------------------------------
simple_xlsx_reader   4.826226   0.109285   4.935511 (  4.977192)
--------------------------------------------- total: 4.935511sec

                         user     system      total        real
simple_xlsx_reader   4.438153   0.073412   4.511565 (  4.529808)

# simple_xslx_reader: Memory

Calculating -------------------------------------
  simple_xlsx_reader   462.283M memsize (   610.319k retained)
                         8.210M objects (     5.390k retained)
                        50.000  strings (    50.000  retained)

# creek: Speed

Rehearsal -----------------------------------------
creek   3.379569   0.083474   3.463043 (  3.486163)
-------------------------------- total: 3.463043sec

            user     system      total        real
creek   3.088136   0.047241   3.135377 (  3.143312)

creek: Memory

Calculating -------------------------------------
               creek   911.539M memsize (   808.365k retained)
                        13.180M objects (     6.106k retained)
                        50.000  strings (    50.000  retained)

# roo: Speed

Rehearsal ---------------------------------------
roo   4.030341   0.101083   4.131424 (  4.185023)
------------------------------ total: 4.131424sec

          user     system      total        real
roo   3.973526   0.054355   4.027881 (  4.047586)

# roo: Memory

Calculating -------------------------------------
                 roo   168.783M memsize (     1.327M retained)
                         2.232M objects (    11.063k retained)
                        50.000  strings (    50.000  retained)

# xsv: Speed

Rehearsal ---------------------------------------
xsv   0.694634   0.045169   0.739803 (  0.746145)
------------------------------ total: 0.739803sec

          user     system      total        real
xsv   0.694462   0.031930   0.726392 (  0.727611)

# xsv: Memory

Calculating -------------------------------------
                 xsv   354.977M memsize (   362.764k retained)
                         2.079M objects (     3.174k retained)
                        50.000  strings (    50.000  retained)
