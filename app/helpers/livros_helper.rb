module LivrosHelper
    def validar_dados(livro)
        #Verifica se todos os campos foram prenchido
        if @livro.titulo.empty? || @livro.codigo.nil? || @livro.autor.empty?
           @error = "Todos os campos devem ser preenchido." 
            true 
        #Verifica se a matricula esta correta
        elsif @livro.codigo.digits.count < 6
           @error = "Codigo incorreta." 
            true 
        #Verifica se o aluno já esta cadastrado
        elsif Livro.where(codigo: @livro.codigo).exists?
           @error = "Livro já cadastrado no sistema." 
            true
        else
            false
        end 
    end

    def gerar_pdf(livro)
        respond_to do |format|
            format.html
            format.pdf do
              pdf = LivrosPdf.new(livro)
              send_data pdf.render, type: "application/pdf", disposition: "inline"
            end
          end
    end
end
