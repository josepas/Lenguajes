module Monoid
    #Minimal implementation
        # mempty  :: a
        # mappend :: a -> a -> a
    
    # mconcat :: [a] -> a
    def mconcat(as)
        acc = mempty
        for i in as.each
            acc = mappend(acc, i)
        end
        acc
    end
end

module Functor
    #Minimal implementation
        # fmap :: (a -> b) -> f a -> f b

    # (<$) :: a -> f b -> f a
    def inj a, fb
    end
end

# Monoid Instances

# All
class TrueClass
    extend Monoid
    mempty = true
    def TrueClass.mappend(a,b)
        a and b
    end
end

# Any
class FalseClass
    extend Monoid
    mempty = false
    def FalseClass.mappend(a,b)
        a or b
    end
end

class String
    extend Monoid
    mempty = ""
    def String.mappend(a,b)
        a + b
    end
end

class Fixnum
    extend Monoid
end

# Functor Instances

class String
    extend Functor
end

class Fixnum
    extend Functor
end