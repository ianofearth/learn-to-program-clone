require 'rails_helper'

describe Subject do
  it { should validate_presence_of :title }
end
