require 'spec_helper'

describe League do
  it { should validate_presence_of :name }
end
