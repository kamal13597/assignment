class Tournament
	
	def initialize()
		@records = Array.new
		@records.push('Team B;Team C;win', 'Team A;Team D;draw', 
		'Team A;Team B;win', 'Team D;Team C;loss', 'Team C;Team A;loss','Team B;Team D;win')
	end

	def result
		score = Hash.new

		@records.map { |value|
			info = value.split(';');
			count = 0
			team1 = team2 = ''
			info.each do |detail|

				if(count == 0 || count == 1)
					if score[detail].nil?
						score[detail] = Hash.new
						score[detail][:MP] = score[detail][:W] =  score[detail][:L] = score[detail][:D] = score[detail][:P] = 0
					end	
					score[detail][:MP] +=1
					team1 = detail if count.eql? 0
					team2 = detail if count.eql? 1
				else
					case detail
						when 'win'
							score = point_table(score, team1, team2)
						when 'loss'
							score = point_table(score, team2, team1)
						when 'draw'
							score[team1][:D] += 1
							score[team1][:P] += 1
							score[team2][:D] += 1
							score[team2][:P] += 1
					end
				end
				count += 1
			end
		}

		score = sort_hash(score)
		puts score
	end

	# sort the hash based on the total score and team name in case if two teams have the same score.
	def sort_hash(score)
		score.sort_by { |key, points| [ points[:P], key ] }.reverse
	end	

	# setting up the point table
	def point_table(score, team1, team2)
		score[team1][:W] += 1
		score[team1][:P] += 3
		score[team2][:L] += 1
		score
	end	

end

obj	= Tournament.new();
obj.result
