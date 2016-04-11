Dir["#{__dir__}/**/*.rb"].each { |file| require_relative file }

DB = ROM.container(default: [:sql, ENV['DATABASE_URL']]) do |rom|
  rom.register_relation(Relations::User)
  rom.register_mapper(Mappers::UserMapper)
  rom.register_command(Commands::UpsertUser)

  rom.register_relation(Relations::Vote)
  rom.register_mapper(Mappers::VoteMapper)
  rom.register_command(Commands::CreateVote)

  rom.register_relation(Relations::Character)
  rom.register_mapper(Mappers::CharacterMapper)
end
