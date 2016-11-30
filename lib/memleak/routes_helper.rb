class ActionDispatch::Routing::Mapper

  def mount_memleak(mount_path)
    mount Memleak::Engine => mount_path
  end

end