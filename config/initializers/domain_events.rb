Dir[Rails.root.join("app", "domain", "commands", "*.rb")].each do |file|
  require_dependency file
end
Dir[Rails.root.join("app", "domain", "events", "*.rb")].each do |file|
  require_dependency file
end
Dir[Rails.root.join("app", "domain", "services", "*.rb")].each do |file|
  require_dependency file
end
Dir[Rails.root.join("app", "domain", "handlers", "*.rb")].each do |file|
  require_dependency file
end
