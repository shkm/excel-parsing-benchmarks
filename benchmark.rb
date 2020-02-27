require 'benchmark/ips'
require 'benchmark/memory'
SHEET_PATH = "sheet.xlsx"
BENCHMARK_TIME = 3600.freeze # 1 hour each

rubyxl = lambda do
  require 'rubyXL'
  RubyXL::Parser.parse(SHEET_PATH).worksheets[0].each do |row|
    row.cells.each { |row| row.value }
  end
end

simple_xlsx_reader = lambda do
  require 'simple_xlsx_reader'
  SimpleXlsxReader.open(SHEET_PATH).sheets[0].rows.each do |row|
    row.each { |cell| cell }
  end
end

creek = lambda do
  require 'creek'
  Creek::Book.new(SHEET_PATH).sheets[0].rows.each do |row|
    row.each { |_, cell| cell }
  end
end

roo = lambda do
  require 'roo'
  Roo::Excelx.new(SHEET_PATH).each_row_streaming do |row|
    row.each { |cell| cell.value }
  end
end

xsv = lambda do
  require 'xsv'
  sheet = Xsv::Workbook::open(SHEET_PATH).sheets[0].each_row do |row|
    row.each { |cell| cell }
  end
end

BENCHMARKS = {
  'rubyxl' => rubyxl,
  'simple_xlsx_reader' => simple_xlsx_reader,
  'creek' => creek,
  'roo' => roo,
  'xsv' => xsv
}.freeze

def time(name, &proc)
  puts "# #{name}: Speed"
  puts
  Benchmark.ips do |benchmark|
    benchmark.time = BENCHMARK_TIME
    benchmark.report(name, &proc)
  end
  puts
end

def memory(name, &proc)
  puts "# #{name}: Memory"
  puts
  Benchmark.memory { |benchmark| benchmark.report(name, &proc) }
  puts
end

# def memory(name, &proc)
#   puts "# #{name}: Memory"
#   puts
#   MemoryProfiler.report(&proc).pretty_print(scale_bytes: true)
#   puts
# end

def main
  case ARGV[0]
  when 'time' then time(ARGV[1], &BENCHMARKS[ARGV[1]])
  when 'memory' then memory(ARGV[1], &BENCHMARKS[ARGV[1]])
  else puts "Usage: memory|time name"
  end
end

main
