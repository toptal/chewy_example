require 'spec_helper'

describe EntertainmentSearch do
  def search attributes = {}
    EntertainmentSearch.new(attributes).search
  end

  def import *args
    EntertainmentIndex.import *args
  end

  before { EntertainmentIndex.purge! } # deletes and creates index

  describe '#min_year, #max_year' do
    let(:book) { create(:book, year: 1925) }
    let(:movie) { create(:movie, year: 1970) }
    let(:cartoon) { create(:cartoon, year: 1995) }
    before { import book: book, movie: movie, cartoon: cartoon }

    specify { search(min_year: 1970).load.should =~ [movie, cartoon] }
    specify { search(max_year: 1980).load.should =~ [book, movie] }
    specify { search(min_year: 1970, max_year: 1980).load.should == [movie] }
    specify { search(min_year: 1980, max_year: 1970).should == [] }
  end
end
