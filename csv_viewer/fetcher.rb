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