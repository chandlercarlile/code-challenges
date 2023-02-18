class Card
  attr_accessor :rank, :suit

  SUITS = [:spades, :hearts, :diamonds, :clubs]
  RANKS = [
    :ace,
    :king,
    :queen,
    :jack,
    :ten,
    :nine,
    :eight,
    :seven,
    :six,
    :five,
    :four,
    :three,
    :two,
  ]

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def name
    "#{rank} of #{suit}"
  end
end
