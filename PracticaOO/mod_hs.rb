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
        fmap(fb) {a}
    end
    
end

# Monoid Instances

# All
class TrueClass
    extend Monoid
    def TrueClass.mempty
        true
    end
    
    def TrueClass.mappend(a,b)
        a and b
    end
end

# Any
class FalseClass
    extend Monoid
    def FalseClass.mempty
        false
    end

    def FalseClass.mappend(a,b)
        a or b
    end

end

class String
    extend Monoid
    def String.mempty
        ""
    end

    def String.mappend(a,b)
        a + b
    end
end

class Fixnum
    extend Monoid
    def Fixnum.mempty
        0
    end

    def Fixnum.mappend(a,b)
        a + b
    end

end

# Functor Instances

class String
    extend Functor
    def String.fmap(fa, &block)
        r = ""
        fa.split("").each do
           r << yield
        end
        r
    end

end

class Fixnum
    extend Functor
    def Fixnum.fmap(fa, &block)
        r = []
        fa.each do
            r << yield
        end
        r
    end
end