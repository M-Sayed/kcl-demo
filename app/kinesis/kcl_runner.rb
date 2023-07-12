# frozen_string_literal: true

class KclRunner
  def self.call
    Kcl::Worker.run(ENV['KCL_WORKER_NAME'], RecordProcessorFactory.new)
  end
end
