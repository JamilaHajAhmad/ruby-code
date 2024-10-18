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