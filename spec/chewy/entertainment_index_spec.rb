require 'spec_helper'

describe EntertainmentIndex do
  describe 'Tag' do
    let(:books) { create_list :book, 2, tag_list: 'tag1' }
    specify do
      expect do
        ActsAsTaggableOn::Tag.where(name: 'tag1').first.update_attributes(name: 'tag2')
      end.to update_index('entertainment#book').and_reindex(books, with: {tags: ['tag2']})
    end
  end
end
