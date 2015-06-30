require 'rails_helper'

describe "the delete subject process" do
  it "deletes a subject" do
    testSubject = Subject.create({title: "Bubbles", number: 1})
    visit subject_path(testSubject)
    click_on 'Delete'
    expect(page).to have_no_content 'Bubbles'
  end
end
