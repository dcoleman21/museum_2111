class Museum 
  attr_reader :name,
              :exhibits,
              :patrons
  def initialize(name)
    @name     = name 
    @exhibits = []
    @patrons  = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit 
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron 
  end

  def patrons_by_exhibit_interest
    by_interest = {}
    @exhibits.each do |exhibit|
      by_interest[exhibit] = []
    end
    @patrons.each do |patron|
      exhibits = recommend_exhibits(patron)
      exhibits.each do |exhibit|
        by_interest[exhibit] << patron 
      end
    end 
   by_interest
  end

  def ticket_lottery_contestants(exhibit)
    lottery_contestants = patrons_by_exhibit_interest[exhibit]
    lottery_contestants.select do |patron|
      patron.spending_money < exhibit.cost 
    end
  end

  def draw_lottery_winner(exhibit)
    lottery_contestants = ticket_lottery_contestants(exhibit)
    return nil if lottery_contestants.empty?
    winner = lottery_contestants.sample
    winner.name 
  end

  def announce_lottery_winner(exhibit)
    winner = draw_lottery_winner(exhibit)
    if winner.nil?
      "No winners for this lottery"
    else
     "#{winner} has won the #{exhibit.name} exhibit lottery"
    end
  end
end