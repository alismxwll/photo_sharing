require 'rails_helper'

describe Post do
  it { should validate_presence_of :description }
  it { should have_many :tags }
  it { should have_many :comments }
end
