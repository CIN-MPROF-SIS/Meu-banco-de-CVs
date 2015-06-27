# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
ActiveSupport::Inflector.inflections(:en) do |inflect|
    #inflect.clear :uncountables
    #inflect.irregular 'unidadeFederativa', 'unidadesFederativas'
    inflect.irregular 'unidadeFederativa', 'unidadesFederativas'
    inflect.irregular 'faixaSalarial', 'faixasSalariais'
    inflect.irregular 'faixa_salarial', 'faixas_salariais'
    inflect.irregular 'unidade_federativa', 'unidades_federativas'
    inflect.irregular 'grauFormacao', 'GrausFormacao'
    inflect.irregular 'grau_formacao', 'graus_formacao'
    inflect.irregular 'nivel', 'niveis'
    inflect.irregular 'pessoaFisica', 'pessoasFisicas'
    inflect.irregular 'pessoa_fisica', 'pessoas_fisicas'
    inflect.irregular 'moderador', 'moderadores'
end
