require 'rails_helper'

describe Tag do
  it { should belong_to :post }
  it { should belong_to :user }
end
