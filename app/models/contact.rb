class Contact < ApplicationRecord
  belongs_to :kind #, optional: true ==>> cadastra o contato sem precisar passar o kind, porém fica null

  def birthdate_br
    I18n.l(birthdate) unless birthdate.blank?
  end

  # def author
  #   'Diego Felipe'
  # end
  #
  # def cpf
  #   '12335412323'
  # end
  #
  # def kind_description
  #   kind.description
  # end
  #
  # # esse método redefini o as_json para as opções que você queira
  # def as_json(options = {})
  #   super(
  #       methods: %i[author cpf kind_description],
  #       root: true,
  #       # include: :kind   ==>> traz todos os atributos
  #       include: { kind: { only: :description } } #==>> traz apenas o atributo description
  #   )
  # end

  def hello
    I18n.t('hello')
  end

  def i18n
    I18n.default_locale
  end

  def to_br
    {
      name: name,
      email: email,
      birthdate: (I18n.l(birthdate) unless birthdate.blank?)
    }
  end

end
