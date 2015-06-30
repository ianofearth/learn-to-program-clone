require 'rails_helper'

describe "the edit lessons process" do
  it "edits a lesson" do
    testsubject = Subject.create({:title => 'silly string', :number => 1})
    testlesson = Lesson.create({:title => "lesson title", :content => 'blah blah blah', :number => 1, :subject_id => testsubject.id})

    visit edit_subject_lesson_path(testsubject, testlesson)
    fill_in 'Title', :with => 'nonrandom title'
    click_on 'Update Lesson'
    expect(page).to have_content 'nonrandom title'
  end

  it "gives error when no title is entered" do
    testsubject = Subject.create({:title => 'random title', :number => 1})
    testlesson = Lesson.create({:title => "lesson title", :content => 'blah blah blah', :number => 1, :subject_id => testsubject.id})
    visit edit_subject_lesson_path(testsubject, testlesson)
    fill_in 'Title', :with => ''
    click_on 'Update Lesson'
    expect(page).to have_content 'errors'
  end

end
