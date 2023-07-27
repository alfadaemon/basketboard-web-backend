class Mutations::CreatePlayer < Mutations::BaseMutation
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :doc_number, String, required: true

  field :player, Types::PlayerType, null: false
  field :errors, [String], null: false

  def resolve(first_name:, last_name:, doc_number:)
    player = Player.new(first_name: first_name, last_name: last_name, doc_number: doc_number)

    if player.save
      { player: player, errors: [] }
    else
      { player: nil, errors: player.errors.full_messages }
    end
  end
end