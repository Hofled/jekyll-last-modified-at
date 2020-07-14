# frozen_string_literal: true

require 'spec_helper'

describe(Jekyll::LastModifiedDate::Executor) do
  it 'gets and strips the output' do
    expect(described_class.sh('echo', 'ohai')).to eql('ohai')
  end
end
