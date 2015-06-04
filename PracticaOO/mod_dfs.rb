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
