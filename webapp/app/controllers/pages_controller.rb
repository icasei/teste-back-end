class PagesController < ApplicationController
    def index
        relatorio_save
    end

    def sobre 
        relatorio_save
    end

    def relatorio
        @rel = Relatorio.order("id DESC").limit(50)
    end

    private
    def relatorio_save
        rel = Relatorio.new
        rel.guid = cookies[:guid]
        rel.data = cookies[:data]
        rel.url = cookies[:URL]
        rel.save
    end
end