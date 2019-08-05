require_relative "tree_node.rb"
class KnightPathFinder

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        build_move_tree(root_node)
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)
        x,y = pos
            positions = {
                pos1 => [x+2,y+1],
                pos2 => [x+2,y-1],
                pos3 => [x-2,y+1],
                pos4 => [x-2,y-1],
                pos5 => [x+1,y+2],
                pos6 => [x+1,y-2],
                pos7 => [x-1,y+2],
                pos8 => [x-1,y-2]
            }

        positions.values.select do|pos|
            (0 <= pos[0] && pos[0] <= 7) &&( 0 <= pos[1] && pos[1] <= 7)
        end
    end
    
    def new_move_positions(pos)

        current_moves = KnightPathFinder.valid_moves(pos)
        new_moves = current_moves.select do |pos|
            !considered_positions.include?(pos)
        end
        new_moves.each {|move| considered_positions << move }
        new_moves
    end

    def build_move_tree(root)
        queue = [root]
        until queue.empty? 
            suspect  = queue.shift 
           
                new_move_positions(suspect.value).each do |move|
                   enqueue =  PolyTreeNode.new(move)
                   enqueue.parent=(suspect)
                   queue << enqueue
               
            end
        end
        

    end

    def find_path

       # [7,y]   y closest to curr_y
    end

end