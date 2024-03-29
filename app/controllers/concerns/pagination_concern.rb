# frozen_string_literal: true

module PaginationConcern
  def paginate(scope)
    scope.page(page).per per_page
  end

  def page
    params[:page] || 1
  end

  def per_page
    params[:per]
  end
end
