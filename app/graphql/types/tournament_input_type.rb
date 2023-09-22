module Types
  class TournamentInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :name, String, required: false
    argument :start_date, GraphQL::Types::ISO8601DateTime, required: false
    argument :end_date, GraphQL::Types::ISO8601DateTime, required: false
  end
end
