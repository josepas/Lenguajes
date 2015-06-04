module DFS
    
    def dfs &block
        node = self
        yield node
        node.each do |child|
            child.dfs &block unless child == nil 
        end
    end

    def dfs! &block
        node = self
        node.n = yield node
        node.each do |child|
            child.dfs! &block unless child == nil 
        end
    end

end

module BFS

    def bfs &block
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

end
