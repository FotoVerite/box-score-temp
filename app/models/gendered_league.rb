# decorates the League with gender
GenderedLeague = Struct.new(:league, :gender) do
  delegate :id, :name, to: :league
end
