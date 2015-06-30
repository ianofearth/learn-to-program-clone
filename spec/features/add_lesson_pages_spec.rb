require 'rails_helper'

describe "the add lesson process" do
  it "adds a new lesson" do
    testSubject = Subject.create({title: "Random Title", number: 1})
    visit subject_path(testSubject)
    click_on 'Add a new lesson'
    fill_in 'Title', :with => 'Randomer Title'
    fill_in 'Content', :with => 'Random Content'
    fill_in 'Number', :with => 1
    click_on 'Create Lesson'
    expect(page).to have_content 'Randomer Title'
  end

  it "gives error when no title is entered" do
    testSubject = Subject.create({title: "Random Title", number: 1})
    visit new_subject_lesson_path(testSubject)
    click_on 'Create Lesson'
    expect(page).to have_content 'errors'
  end
end
