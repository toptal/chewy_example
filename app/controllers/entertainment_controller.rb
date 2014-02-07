class EntertainmentController < ApplicationController
  def index
    @search = EntertainmentSearch.new(params[:search])
    @entertainments = @search.search.only(:id).page(params[:page]).load(
      book: {scope: Book.includes(:author)},
      movie: {scope: Video.includes(:director)},
      cartoon: {scope: Video.includes(:director)}
    )
  rescue Elasticsearch::Transport::Transport::Errors::BadRequest => e
    @entertainments = []
    @error = e.message.match(/QueryParsingException\[([^;]+)\]/).try(:[], 1)
  end
end
