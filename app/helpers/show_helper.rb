module ShowHelper

  def button_show path, size="xs", style=""
    link_to path, class: "btn btn-#{size} #{style}" do
      tag :i, class: 'fa fa-eye'
    end
  end

  def button_edit path, size="xs", style=""
    link_to path, class: "btn btn-#{size} #{style}" do
      tag :i, class: 'fa fa-pencil'
    end
  end

  def button_destroy path, size="xs", style="btn-danger"
    link_to path, class: "btn btn-#{size} #{style}", method: :delete, data: { confirm: 'Are you sure?' } do
      tag :i, class: 'fa fa-trash-o'
    end
  end

end
