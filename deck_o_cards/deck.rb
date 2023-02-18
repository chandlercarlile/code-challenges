require_relative "card"

class Deck
  attr_accessor :cards

  def initialize
    self.cards = []

    ::Card::SUITS.each do |suit|
      ::Card::RANKS.each do |rank|
        cards << ::Card.new(rank, suit)
      end
    end
  end

  def gather_cards
    initialize

    true
  end

  def shuffle
    cards.shuffle!
  end

  def sort
    # TODO: fully implement this, by adding comparisons to card class between ranks and suits
    # currently sorts by char values in suit/rank
    cards.sort_by! { |card| [card.suit, card.rank] }
  end

  def draw(amount: 1)
    amount.times do |_i|
      if cards.size == 0
        puts "no more cards in the deck!"
        return
      else
        puts cards.shift.name
      end
    end
  end

  def draw_all
    if cards.size == 0
      puts "no more cards in the deck!"
      return
    else
      cards.size.times do |_i|
        self.draw
      end
    end
  end
end
