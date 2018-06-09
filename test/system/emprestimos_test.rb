require "application_system_test_case"

class EmprestimosTest < ApplicationSystemTestCase
  setup do
    @emprestimo = emprestimos(:one)
  end

  test "visiting the index" do
    visit emprestimos_url
    assert_selector "h1", text: "Emprestimos"
  end

  test "creating a Emprestimo" do
    visit emprestimos_url
    click_on "New Emprestimo"

    fill_in "Aluno", with: @emprestimo.aluno
    fill_in "Codigo", with: @emprestimo.codigo
    fill_in "Data Devoluncao", with: @emprestimo.data_devoluncao
    fill_in "Data Emprestimo", with: @emprestimo.data_emprestimo
    fill_in "Livro", with: @emprestimo.livro
    fill_in "Matricula", with: @emprestimo.matricula
    click_on "Create Emprestimo"

    assert_text "Emprestimo was successfully created"
    click_on "Back"
  end

  test "updating a Emprestimo" do
    visit emprestimos_url
    click_on "Edit", match: :first

    fill_in "Aluno", with: @emprestimo.aluno
    fill_in "Codigo", with: @emprestimo.codigo
    fill_in "Data Devoluncao", with: @emprestimo.data_devoluncao
    fill_in "Data Emprestimo", with: @emprestimo.data_emprestimo
    fill_in "Livro", with: @emprestimo.livro
    fill_in "Matricula", with: @emprestimo.matricula
    click_on "Update Emprestimo"

    assert_text "Emprestimo was successfully updated"
    click_on "Back"
  end

  test "destroying a Emprestimo" do
    visit emprestimos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Emprestimo was successfully destroyed"
  end
end
