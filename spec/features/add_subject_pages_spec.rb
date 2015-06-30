require 'rails_helper'

describe "the add subject process" do
  it "adds a new subject" do
    visit subjects_path
    click_on 'Add a Subject'
    fill_in 'Title', :with => 'Random Title'
    fill_in 'Number', :with => 1
    click_on 'Create Subject'
    expect(page).to have_content 'Random Title'
  end

  it "gives error when no title is entered" do
    visit new_subject_path
    click_on 'Create Subject'
    expect(page).to have_content 'errors'
  end
end
