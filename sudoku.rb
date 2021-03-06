module Sudoku
  class Puzzle
    ASCII = ".123456789"
    BIN = "\000\001\002\003\004\005\006\007\010\011"

    def initialize(lines)
      if (lines.respond_to? :join)
        s = lines.join
      else
        s = lines.dup
      end

      s.gsub!(/\s/, "") # /\s/ is a Regexp that matches any whitespace

      raise Invalid, "Grid is the wrong size" unless s.size == 81

      if i = s.index(/[^123456789\.]/)
        raise Invalid, "Illegal character #{s[i, 1]} in puzzle"
      end

      s.tr!(ASCII, BIN)

      @grid = s.unpack("c*")

      raise Invalid, "Initial puzzle has duplicates" if has_duplicates?
    end

    def to_s
      (0..8).collect { |r| @grid[r * 9, 9].pack("c9") }.join("\n").tr(BIN, ASCII)
    end

    # Return a duplicate of this Puzzle object.
    # This method overrides Object.dup to copy the @grid array.
    def dup
      copy = super
      @grid = @grid.dup
      copy
    end

    def [](row, col)
      @grid[row * 9 + col]
    end

    def []=(row, col, newvalue)
      # Raise an exception unless the new value is in the range 0 to 9.
      unless (0..9).include? newvalue
        raise Invalid, "illegal cell value"
      end
      # Set the appropriate element of the internal array to the value.
      @grid[row * 9 + col] = newvalue
    end

    BoxOfIndex = [
      0, 0, 0, 1, 1, 1, 2, 2, 2, 0, 0, 0, 1, 1, 1, 2, 2, 2, 0, 0, 0, 1, 1, 1, 2, 2, 2,
      3, 3, 3, 4, 4, 4, 5, 5, 5, 3, 3, 3, 4, 4, 4, 5, 5, 5, 3, 3, 3, 4, 4, 4, 5, 5, 5,
      6, 6, 6, 7, 7, 7, 8, 8, 8, 6, 6, 6, 7, 7, 7, 8, 8, 8, 6, 6, 6, 7, 7, 7, 8, 8, 8,
    ].freeze

    def each_unknown
      0.upto 8 do |row|
        # For each row
        0.upto 8 do |col|
          # For each column
          index = row * 9 + col
          # Cell index for (row,col)
          next if @grid[index] != 0 # Move on if we know the cell's value
          box = BoxOfIndex[index]
          # Figure out the box for this cell
          yield row, col, box
          # Invoke the associated block
        end
      end
    end

    def has_duplicates?
      # uniq! returns nil if all the elements in an array are unique.
      # So if uniq! returns something then the board has duplicates.
      0.upto(8) { |row| return true if rowdigits(row).uniq! }
      0.upto(8) { |col| return true if coldigits(col).uniq! }
      0.upto(8) { |box| return true if boxdigits(box).uniq! }
      false
    end

    AllDigits = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze

    def possible(row, col, box)
      AllDigits - (rowdigits(row) + coldigits(col) + boxdigits(box))
    end

    private

    def rowdigits(row)
      @grid[row * 9, 9] - [0]
    end

    # Return an array of all known values in the specified column.
    def coldigits(col)
      result = []
      # Start with an empty array
      col.step(80, 9) { |i|
        # Loop from col by nines up to 80
        v = @grid[i]
        # Get value of cell at that index
        result << v if (v != 0) # Add it to the array if non-zero
      }
      result
      # Return the array
    end

    # Map box number to the index of the upper-left corner of the box.
    BoxToIndex = [0, 3, 6, 27, 30, 33, 54, 57, 60].freeze
    # Return an array of all the known values in the specified box.
    def boxdigits(b)
      # Convert box number to index of upper-left corner of the box.
      i = BoxToIndex[b]
      # Return an array of values, with 0 elements removed.
      [
        @grid[i],
        @grid[i + 1], @grid[i + 2],
        @grid[i + 9], @grid[i + 10], @grid[i + 11],
        @grid[i + 18], @grid[i + 19], @grid[i + 20],
      ] - [0]
    end
  end # This is the end of the Puzzle class

  class Invalid < StandardError
  end

  class Impossible < StandardError
  end

  def Sudoku.scan(puzzle)
    unchanged = false # This is our loop variable
    # Loop until we've scanned the whole board without making a change.
    until unchanged
      unchanged = true
      # Assume no cells will be changed this time
      rmin, cmin, pmin = nil # Track cell with minimal possible set
      min = 10

      puzzle.each_unknown do |row, col, box|
        # Find the set of values that could go in this cell
        p = puzzle.possible(row, col, box)
        case p.size
        when 0 # No possible values means the puzzle is over-constrained
          raise Impossible
        when 1 # We've found a unique value, so set it in the grid
          puzzle[row, col] = p[0] # Set that position on the grid to the value
          unchanged = false
          # Note that we've made a change
        else
          if unchanged && p.size < min
            min = p.size
            # Current smallest size
            rmin, cmin, pmin = row, col, p # Note parallel assignment
          end
        end
      end
    end
    # Return the cell with the minimal set of possibilities.
    # Note multiple return values.
    return rmin, cmin, pmin
  end
  def Sudoku.solve(puzzle)
    # Make a private copy of the puzzle that we can modify.
    puzzle = puzzle.dup

    r, c, p = scan(puzzle)
    # If we solved it with logic, return the solved puzzle.
    return puzzle if r == nil

    p.each do |guess|
      # For each value in the set of possible values
      puzzle[r, c] = guess
      # Guess the value
      begin
        return solve(puzzle) # If it returns, we just return the solution
      rescue Impossible
        next
        # If it raises an exception, try the next guess
      end
    end

    raise Impossible
  end
end
