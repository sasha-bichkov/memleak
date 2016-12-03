class MemProfiler

  ENGINE_TITLE = 'memleak'

  def initialize(app)
    @app = app
  end

  def call(env)
    if is_assets_path?(env)
      app_call(env)
    else
      snapshot = make_memory_snapshot env
      request_params = get_request_path_params env
      save_memory_snapshot snapshot, request_params

      [@status, @headers, @response]
    end
  end

  private

  def app_call(env)
    @status, @headers, @response = @app.call(env)
  end

  def is_assets_path?(env)
    env['REQUEST_PATH'].match /^\/assets\//
  end

  def make_memory_snapshot(env)
    MemoryProfiler.report do
      app_call(env)
    end
  end

  # todo: variable snapshot is still not being used.
  def save_memory_snapshot(snapshot, request_params)
    action = request_params[:action]
    controller = format_controller request_params[:controller]

    # p snapshot.allocated_memory_by_gem
    # p snapshot.allocated_objects_by_gem

    # p snapshot.allocated_memory_by_file
    # p snapshot.allocated_objects_by_file

    # p snapshot.allocated_memory_by_location
    # p snapshot.allocated_objects_by_location

    # p snapshot.allocated_memory_by_class
    # p snapshot.allocated_objects_by_class

    MemorySnapshot.create! action: action,
      controller: controller,
      total_allocated_objects: snapshot.total_allocated,
      total_allocated_memsize: snapshot.total_allocated_memsize,
      total_retained_objects: snapshot.total_retained,
      total_retained_memsize: snapshot.total_retained_memsize
  end

  # todo: is there any way to get controller class directly?
  def format_controller(controller)
    controller.gsub("#{ENGINE_TITLE}/", '').capitalize << 'Controller'
  end

  def get_request_path_params(env)
    env["action_dispatch.request.path_parameters"]
  end

end
