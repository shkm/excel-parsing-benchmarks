#!/usr/bin/env bash

declare -a gems=("rubyxl" "simple_xlsx_reader" "creek" "roo" "xsv")
declare -a benchmarks=("time" "memory")

for gem in "${gems[@]}"; do
  for benchmark in "${benchmarks[@]}"; do
    bundle exec ruby benchmark.rb $benchmark $gem
  done
done
