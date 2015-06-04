module Foldable

    def fold(b, &block)
        cola = []
        cola << self
        while(!cola.empty?) 
            node = cola.shift
            b = yield b, node.n 
            node.each do |child|
                cola << child unless child == nil
            end
        end
        return b
    end

    def map &block
        cola = []
        cola << self
        while(!cola.empty?) 
            node = cola.shift
            yield node 
            node.each do |child|
                cola << child unless child == nil
            end
        end

    end

    def map! &block
        cola = []
        cola << self
        while(!cola.empty?) 
            node = cola.shift
            node.n = yield node 
            node.each do |child|
                cola << child unless child == nil
            end
        end
    end

end
