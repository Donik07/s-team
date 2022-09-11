class DestroyInArchiveJob
  include Sidekiq::Job

  def perform(name)
    puts "#{name}Hello from Sidekiq!"
  end
end
