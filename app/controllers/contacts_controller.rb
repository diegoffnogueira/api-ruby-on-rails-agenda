class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show update destroy]

  # GET /contacts
  def index
    @contacts = Contact.all

    # envia a raiz  do jason: contact: {}
    # render json: @contacts, root: true

    # envia somente o nome e o email
    # render json: @contacts, only: %i[name email]

    # envia todos os campos exceto nome e email
    # render json: @contacts, except: %i[name email]

    # concatenando um novo atributo no json de resposta com map, como são vários usa o map
    # render json: @contacts.map { |contact|
    #   contact.attributes.merge(author: 'Diego', teste: 'teste')
    # }

    # concatenando um novo atributo no json de resposta com method que fica em model
    # render json: @contacts, methods: %i[author cpf]

    # está utilizando o método do model contact as_json para fornecer um padrão de retorno
    render json: @contacts, methods: %i[birthdate_br hello i18n]
  end

  # GET /contacts/1
  def show
    # concatenando um novo atributo no jason de resposta com map
    # render json: @contact.attributes.merge(author: 'Diego', teste: 'teste')

    render json: @contact.to_br
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def contact_params
    params.require(:contact).permit(:name, :email, :birthdate, :kind_id)
  end
end
