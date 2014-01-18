require "rspec/mocks/standalone"
require_relative "string_comparator"
require "pry"

describe StringComparator do
  context '.compare' do
   let(:long)  { "long"  } #this string is "long"
   let(:short) { "short" } #this string is "short". Get it :)
   let(:twin)  { "short" }

    it 'takes two strings' do
      expect(described_class).to receive(:compare).with long, short
      described_class.compare long, short
    end

    it 'returns argument error for invalid arguemnt type' do
      expect { described_class.compare 1,1 }.to raise_error(ArgumentError)
    end

    describe 'string1 < string2' do
      it 'returns a -1' do
        expect(described_class).to receive(:compare).and_return(-1)
        described_class.compare long, short
      end

      it 'prints param1 and param2 both in reverse' do
        expect(STDOUT).to receive(:puts).with long.reverse, short.reverse
        described_class.compare long, short
      end
    end

    describe 'string1 > string2' do
      it 'returns a -1' do
        expect(described_class).to receive(:compare).and_return(1)
        described_class.compare short, long
      end

      it 'prints param1+param2 in reverse' do
        expect(STDOUT).to receive(:puts).with "tgrnoohls"
        described_class.compare short, long
      end
    end

    describe 'string1 == string2' do
      it 'returns a 0' do
        expect(described_class).to receive(:compare).and_return(0)
        described_class.compare "hello", "world"
      end

      it 'prints param1+param2' do
        expect(STDOUT).to receive(:puts).with "hweolrllod"
        described_class.compare "hello", "world"
      end
    end
  end

end
