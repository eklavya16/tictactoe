#created by Eklavya Chawla
#last updated 9/14/14

# get sample x/o for user and opposite for computer
$u = ["x","o"].sample
def switchUser
	if $u == "x"
		$u = "o"
	else
		$u = "x"
	end
end

#array to use for moves on the board
$b = [1,2,3,4,5,6,7,8,9] 

# draw the board with the new values
def drawBoard
	puts $b[0].to_s + "|"+$b[1].to_s+"|"+$b[2].to_s
	puts "------"
	puts $b[3].to_s + "|"+$b[4].to_s+"|"+$b[5].to_s
	puts "------"
	puts $b[6].to_s + "|"+$b[7].to_s+"|"+$b[8].to_s
end 

drawBoard

# assign value to user and opposite to computer
$userPlay = $u
puts "You are " + $u + ". Have Fun!"
$compPlay =switchUser.reverse 
	
# user move on the board
def userMove
	puts "Where would you like to move"
		move = gets.chomp.to_s
		n = move.to_i
	if checkSpot(n) == true
		puts "Try again"
		move = gets.chomp.to_s
	end		
	if move == "1"
		$b[0]=$userPlay
	 	drawBoard
	end
	if move == "2"
		$b[1]=$userPlay
		drawBoard
	end
	if move == "3"
		$b[2]=$userPlay
		drawBoard
	end
	if move == "4"
		$b[3]=$userPlay
		drawBoard
	end
	if move == "5"
		$b[4]=$userPlay
		drawBoard
	end
	if move == "6"
		$b[5]=$userPlay
		drawBoard	
	end
	if move == "7"
		$b[6]=$userPlay
		drawBoard
	end
	if move == "8"
		$b[7]=$userPlay
		drawBoard
	end
	if move == "9"
		$b[8]=$userPlay
		drawBoard
	end
end

# computer move
def compMove
	moveToString = $b.sample
	while moveToString == "x" or moveToString == "o"
		moveToString = $b.sample
		if moveToString == "x" or moveToString == "o"
			break
		end
	end
	moveTo = moveToString.to_i
	$b[moveTo] =$compPlay
end

# check if the spot is already taken
def checkSpot(n)
	if $b.include?(n)
		return false
	else
		return true
	end
end

# check if the user or computer won
def checkWin
	# checking line 1 horizontal
	if $b[0] == $b[1] and $b[1] == $b[2]
		winValue = $b[0]
		if $userPlay == winValue
			puts "You won"
			return true
		end
		if $compPlay == winValue
			puts "Computer wins"
			return true
		end
	end
	# checking line 2 horizontal
 	if $b[3] == $b[4] and $b[4] == $b[5]
                winValue = $b[3]
                if $userPlay == winValue
                        puts "You won"
                        return true
                end
                if $compPlay == winValue
                        puts "Computer wins"
                        return true
                end
        end
	
	# checking line 3 horizontal
	if $b[6] == $b[7] and $b[7] == $b[8]
                winValue = $b[6]
                if $userPlay == winValue
                        puts "You won"
                        return true
                end
                if $compPlay == winValue
                        puts "Computer wins"
                        return true
                end
        end

	# checking L to R diagnol
	if $b[0] == $b[4] and $b[4] == $b[8]
                winValue = $b[0]
                if $userPlay == winValue
                        puts "You won"
                        return true
                end
                if $compPlay == winValue
                        puts "Computer wins"
                        return true
                end
        end
end


i = 0
while i <=8
        userMove
        i+=1
	# if user or compuer one, quit the loop
        if checkWin == true
                break
        end
        compMove
        i+=1
        if checkWin == true
                break
        end
        if i == 9
                break
        end
end

	









#end of game loop and win message
