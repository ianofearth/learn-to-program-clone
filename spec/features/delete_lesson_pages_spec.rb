require 'rails_helper'

describe "the delete lesson process" do
  it "deletes a lesson" do
    testSubject = Subject.create({:title => 'gnarly', :number => 1})
    testLesson = Lesson.create({title: "super", content: 'uber', number: 1, :subject_id => testSubject.id})
    visit subject_lesson_path(testSubject, testLesson)
    click_on 'Delete'
    expect(page).to have_content 'utterly'
  end
end
