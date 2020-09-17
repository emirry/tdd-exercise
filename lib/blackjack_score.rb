# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
    score = 0

    hand.each do |card|
      # if !VALID_CARDS.any?(card)
      #   raise ArgumentError.new("#{card} is invalid")
      # end

      case card
      when 'Jack', 'Queen', 'King'
        card = 10
      when 'Ace'
        if hand.include?('Ace')
          card = 1 if score < 21
        end
      else (2..9)
        card = card
      end

      score += card

      if score > 21
        raise ArgumentError.new("Bust! Score is over 21")
      end
    end
    return score
end
