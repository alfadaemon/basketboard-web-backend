class Mutations::UpdatePlayer < Mutations::BaseMutation
  argument :player_id, ID, required: true
  argument :first_name, String, required: false
  argument :last_name, String, required: false
  argument :doc_number, String, required: false

  field :player, Types::PlayerType, null: false
  field :errors, [String], null: false

  def resolve(player_id:, **attributes)
    player = Player.find(player_id)

    if player.update(attributes)
      { player: player, errors: [] }
    else
      { player: nill, errors: player.errors.full_messages }
    end
  end
end