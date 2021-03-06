class MemProfiler

  ENGINE_TITLE = 'memleak'

  def initialize(app)
    @app = app
  end

  def call(env)
    if can_make_snapshot?(env)
      make_memory_snapshot env
    else
      continue_request env
    end

    [@status, @headers, @response]
  end

  private

  def continue_request(env)
    @status, @headers, @response = @app.call(env)
  end

  def can_make_snapshot?(env)
    assets_path?(env) || engine_action?(env)
  end

  def assets_path?(env)
    env['REQUEST_PATH'].match /^\/assets\//
  end

  def engine_action?(env)
    env['REQUEST_PATH'].match /^\/#{ENGINE_TITLE}/
  end

  def make_memory_snapshot(env)
    snapshot = get_request_memory_snapshot env
    request_params = get_request_path_params env
    save_memory_snapshot snapshot, request_params
  end

  def get_request_memory_snapshot(env)
    MemoryProfiler.report do
      continue_request(env)
    end
  end

  def save_memory_snapshot(snapshot, request_params)
    action = request_params[:action]
    controller = format_controller request_params[:controller]

    MemorySnapshot.create!(
      action: action,
      controller: controller,

      total_allocated_objects: snapshot.total_allocated,
      total_allocated_memsize: snapshot.total_allocated_memsize,
      total_retained_objects: snapshot.total_retained,
      total_retained_memsize: snapshot.total_retained_memsize,

      allocated_memory_by_gem: snapshot.allocated_memory_by_gem,
      allocated_objects_by_gem: snapshot.allocated_objects_by_gem,
      retained_memory_by_gem: snapshot.retained_memory_by_gem,
      retained_objects_by_gem: snapshot.retained_objects_by_gem,

      allocated_memory_by_file: snapshot.allocated_memory_by_file,
      allocated_objects_by_file: snapshot.allocated_objects_by_file,
      retained_memory_by_file: snapshot.retained_memory_by_file,
      retained_objects_by_file: snapshot.retained_objects_by_file,

      allocated_memory_by_location: snapshot.allocated_memory_by_location,
      allocated_objects_by_location: snapshot.allocated_objects_by_location,
      retained_memory_by_location: snapshot.retained_memory_by_location,
      retained_objects_by_location: snapshot.retained_objects_by_location,

      allocated_memory_by_class: snapshot.allocated_memory_by_class,
      allocated_objects_by_class: snapshot.allocated_objects_by_class,
      retained_memory_by_class: snapshot.retained_memory_by_class,
      retained_objects_by_class: snapshot.retained_objects_by_class
    )
  end

  # todo: is there any way to get controller class directly?
  def format_controller(controller)
    controller.gsub(/.*\//, '').capitalize << 'Controller'
  end

  def get_request_path_params(env)
    action = env['PATH_INFO']
    Rails.application.routes.recognize_path action
  end

end
