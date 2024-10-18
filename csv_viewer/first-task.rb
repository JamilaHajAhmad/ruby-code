require 'tty-prompt'
require 'csv'
require 'console_table'
require 'fetcher'
require 'selector'
require 'reader'

class Main
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
end
