<%=
def schedule(array)
   array.push nil if array.size.odd?
   n = array.size
   pivot = array.pop
   games = (n - 1).times.map do
     array.rotate!
     [[array.first, pivot]] + (1...(n / 2)).map { |j| [array[j], array[n - 1 - j]] }
   end
   array.push pivot unless pivot.nil?
   games
 end

students = %w(Maressa Bram Claudia Steve Ilsmarie Jeroen Jesse Han Ann Oliver Adrianna Omar Tim Job Elizabeth Kate Andrei Chris)
teams = schedule(students)

i = Random.rand(teams.length)
  teams.each_with_index do |day, index|
      if index == i
        day_teams = day.map { |team| "(#{team.first}, #{team.last})" }.join(", ")
        return "Todays team: #{day_teams}"
      end
  end

%>