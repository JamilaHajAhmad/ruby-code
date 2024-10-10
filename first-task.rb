require 'tty-prompt'
require 'csv'
require 'console_table'


class Fetcher
    attr_reader :path, :files

    def initialize(path)
        @path = path
        @files = fetch_files
    end

    def fetch_files
        Dir.glob("#{path}/*.csv")
    end
end

class Selector
    def initialize(files)
        @files = files
        @prompt = TTY::Prompt.new
    end

    def select_file
        return nil if @files.empty?
        file_names = @files.map { |file| File.basename(file) }
        @prompt.select("Select a file to display:", file_names)
    end
end

class Reader
    def initialize(file_path)
        @file_path = file_path
    end

    def display_file
        rows = CSV.read(@file_path, headers: true)
        table = ConsoleTable.new(rows: rows.to_a)
        puts table
    end
end

csv_path = './csv_files' 

fetcher = Fetcher.new(csv_path)
if fetcher.files.empty?
    puts "No CSV files found in the directory."
    exit
end

selector = Selector.new(fetcher.files)
selected_file = selector.select_file

unless selected_file.nil?
    selected_file_path = File.join(csv_path, selected_file)
    reader = Reader.new(selected_file_path)
    reader.display_file
else
    puts "No file selected."
end
