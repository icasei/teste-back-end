class ContatosController < ApplicationController
    def index
        @contato = Contato.new
        relatorio_save
        @contatos = Contato.all
    end

    def create
        #render plain: params[:contato].inspect
        @contato = Contato.new(contato_params)
        if @contato.save
            flash[:notice] = "Contato Cadastrado com sucesso"
        else
            for x in @contato.errors.full_messages
                flash[x] = x
            end
            
            
        end
        redirect_to contatos_path
    end
    private
    def contato_params
        params.require(:contato).permit(:nome, :email)
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