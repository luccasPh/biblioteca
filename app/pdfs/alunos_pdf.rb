class AlunosPdf < Prawn::Document
    def initialize(alunos)
        super(top_margin: 70)
        @aluno = alunos
        line_items     
    end

    def line_items
        move_down 20
        text "Data #{Time.now.strftime("%d/%m/%Y")}"
        table line_item_rows do
            row(0).font_style = :bold
            columns(1..4).align = :left
            self.row_colors = ["DDDDDD", "FFFFFF"]
            self.header = true
            column(0).width = 10
            self.cell_style = {:size => 10,:width => 135}
        end
    end

    def line_item_rows
        [["Nome", "Matricula", "email", "Telefone"]] + 
        @aluno.map do |item|
            [item.nome, item.matricula, item.email, item.telefone]
        end
    end
end