def longest_fish(fishes) #O(n^2) Quadratic
    longest = ''
    fishes.each_with_index do |fish, i|
        (i+1...fishes.length).each do |j|
            if fishes[i].length > fishes[j].length
                longest = fishes[i]
            else
                longest = fishes[j]
            end
        end
    end
    return longest
end
p longest_fish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
#=> "fiiiissshhhhhh"

def longest_fish1(fishes) #o(nlog n) log linear /linearthmic
    prc = proc {|a, b| a.length <=> b.length}
    sorted = fishes.merge(&prc)
    sorted[-1]
end

def longest_fish2(fishes) #O(n) linear
    longest = 0
    l_f = ''
    fishes.each do |fish|
        if fish.length > longest
            longest = fish.length
            l_f = fish
        end
    end
    return l_f
end 
p longest_fish2(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
#=> "fiiiissshhhhhh"

def slow_dance(dir, tiles_array)
    tiles_array.each_with_index do |dirs, i|
        return i if dirs == dir
    end
end
 tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
               "left",  "left-up"]
               
p slow_dance("up", tiles_array)
#> 0

p slow_dance("right-down", tiles_array)
#> 3

def fast_dance(dir, tiles_array)
    tiles_array.index(dir)
end
p fast_dance("up", tiles_array)
#> 0

p fast_dance("right-down", tiles_array)
#> 3