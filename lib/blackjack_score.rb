# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
    score = 0
    ace_count = 0
    hand.each do |card|
      unless VALID_CARDS.include?(card)
        raise ArgumentError.new("#{card} is invalid")
      end

      case card
      when 'Jack', 'Queen', 'King'
        score += 10
      when 'Ace'
        ace_count += 1
        score += 11
      else
        score += card
      end
    end

    while score > 21 && ace_count > 0
      score -= 10
      ace_count -= 1
    end

    if score > 21
      raise ArgumentError.new("Bust! Score is over 21")
    end

    return score
end

# Maybe I should create a separate variable for ace?

