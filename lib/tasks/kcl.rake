require 'faker'

namespace :kcl do
  task :seed, [:record_count] => [:environment] do |_, args|
    record_count = (args[:record_count].presence || "100").to_i
    kinesis = Kcl::Proxies::KinesisProxy.new(Kcl.config)

    puts "Adding #{record_count} messages to Kinesis"
    record_count.times do |id|
      name = Faker::Name.name
      email = Faker::Internet.email
      user_hash = JSON.generate(User.new(id, name).event_hash)
      email_hash = JSON.generate(Email.new(id, email).event_hash)

      puts "ID: #{id}, name: #{name}"
      puts "ID: #{id}, name: #{email}"

      kinesis.put_record(
        {
          stream_name: Kcl.config.kinesis_stream_name, data: Base64.strict_encode64(user_hash), partition_key: name
        }
      )
      kinesis.put_record(
        {
          stream_name: Kcl.config.kinesis_stream_name, data: Base64.strict_encode64(email_hash), partition_key: email
        }
      )
    end
  end
end
