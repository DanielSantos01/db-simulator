class DB
    attr_accessor :name, :exist, :hashes

    def initialize(name)
        @name = "#{name}.txt"
        check_existence
    end

    def check_existence
        @exist = File.exist?(@name)
    end

    def write(content)
        File.open(@name, "a+") do |file|
            file.write("\n#{content}")
        end
    end

    def get_hash
        File.open(@name, 'r') do |file|
            hashes = []
            file.readlines().each do |line|
                splitted_line = line.split(",")
                hashes.push({
                    "id" => splitted_line[0].to_s[4..-2],
                    "name" => splitted_line[1].to_s[7..-1],
                    "role" => splitted_line[2].to_s.gsub("\n", "")[7..-1],
                })
            end
            @hashes = hashes
        end
    end

    def filter(key, value)
        matched_hashes = []
        for hash in @hashes
            if hash[key] == value
                matched_hashes.push(hash)
            end
        end
        return matched_hashes
    end
end
