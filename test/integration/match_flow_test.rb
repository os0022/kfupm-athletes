require 'test_helper'

class MatchFlowTest < Capybara::Rails::TestCase
  def setup
    @one = matches :one
    @two = matches :two
  end

  test 'match index' do
    visit matches_path

    assert page.has_content?(@one.category)
    assert page.has_content?(@two.category)
  end

  test 'writing a new match' do
    visit matches_path

    click_on 'Create new match'

    fill_in 'category', with: 'football'
    fill_in 'position',  with: 'Any'
    fill_in 'date',  with: '11/08/2018'
    fill_in 'start_time',  with: '11:00'
    fill_in 'field',  with: 'court1'
    fill_in 'num_of_player',  with: 3

    click_on 'Save Match'

    assert_current_path match_path(Match.last)
    assert page.has_content?('football')
    assert page.has_content?('Any')
    assert page.has_content?('11/08/2018')
    assert page.has_content?('11:00')
    assert page.has_content?('court1')
    assert page.has_content?(3)
  end
end