require 'rails_helper'

describe "the edit subject process" do
  it "edits a subject" do
    testsubject = Subject.create({:title => 'random title', :number => 1})
    visit edit_subject_path(testsubject)
    fill_in 'Title', :with => 'nonrandom title'
    click_on 'Update Subject'
    expect(page).to have_content 'nonrandom title'
  end

  it "gives error when no title is entered" do
    testsubject = Subject.create({:title => 'random title', :number => 1})
    visit edit_subject_path(testsubject)
    fill_in 'Title', :with => ''
    click_on 'Update Subject'
    expect(page).to have_content 'errors'
  end

end
