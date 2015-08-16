require 'spec_helper'

describe Minitest::Blink1Reporter do
  it 'has a version number' do
    expect(Minitest::Blink1Reporter::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
