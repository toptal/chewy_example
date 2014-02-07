class EntertainmentSearch
  include ActiveData::Model

  SORT = {title: {'title.sorted' => :asc}, year: {year: :desc}, relevance: :_score}

  attribute :query, type: String
  attribute :author_id, type: Integer
  attribute :min_year, type: Integer
  attribute :max_year, type: Integer
  attribute :tags, mode: :arrayed, type: String, normalize: ->(value) { value.reject(&:blank?) }
  attribute :sort, type: String, enum: %w(title year relevance), default_blank: 'relevance'

  # This accessor is for interface. It will have only one text field
  # for comma-separated tags input.
  def tag_list= value
    self.tags = value.split(',').map(&:strip)
  end

  def tag_list
    self.tags.join(', ')
  end

  def index
    EntertainmentIndex
  end

  def search
    [query_string, author_id_filter, year_filter, tags_filter, sorting].compact.reduce(:merge)
  end

  def sorting
    index.order(SORT[sort.to_sym])
  end

  def query_string
    index.query(query_string: {fields: [:title, :author, :description], query: query, default_operator: 'and'}) if query?
  end

  def author_id_filter
    index.filter(term: {author_id: author_id}) if author_id?
  end

  def year_filter
    body = {}.tap do |body|
      body.merge!(gte: min_year) if min_year?
      body.merge!(lte: max_year) if max_year?
    end
    index.filter(range: {year: body}) if body.present?
  end

  def tags_filter
    index.filter(terms: {tags: tags}) if tags?
  end
end
