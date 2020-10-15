require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'
require 'simplecov'
SimpleCov.start

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do

    hand = ['Jack', 3, 5]
    score = blackjack_score(hand)
    expect(score).must_equal 18

  end

  it 'calculates aces as 11 where it does not go over 21' do
    hand = ['Ace', 7]
    score = blackjack_score(hand)
    expect(score).must_equal 18
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    hand = ['Ace', 5, 9]
    score = blackjack_score(hand)
    expect(score).must_equal 15

  end

  it 'raises an ArgumentError for invalid cards' do
    hand = ['poker', 2]

    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for scores over 21' do
    hand = [10, 10, 3]

    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

  end
end
