# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from Exception, with: :handle_exception

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def handle_exception(exception = nil)
    if exception&.class == Mongoid::Errors::DocumentNotFound
      return render_404
    else
      return render_500
    end
  end

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def render_500
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/500", status: 500 }
      format.all { render nothing: true, status: 500 }
    end
  end
end
