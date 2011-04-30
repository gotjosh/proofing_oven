Before do
  Mongoid.master.collections.select {|c| c.name !~ /system/ }.each(&:drop)
end
