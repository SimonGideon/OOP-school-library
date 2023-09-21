module Common
    @@id_counter = 0

    def self.next_id
        @@id_counter += 1
    end
end