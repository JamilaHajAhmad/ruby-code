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