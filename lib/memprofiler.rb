class MemProfiler
  def initialize(app)
    @app = app
  end

  def call(env)
    report = MemoryProfiler.report do
      @status, @headers, @response = @app.call(env)
    end
    # p report.allocated_memory_by_gem
    # p report.pretty_print
    [@status, @headers, @response]
  end

end
