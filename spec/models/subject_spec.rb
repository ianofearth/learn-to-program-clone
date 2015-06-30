require 'rails_helper'

describe Subject do
  it { should validate_presence_of :title }
  it { should have_many :lessons}
end
