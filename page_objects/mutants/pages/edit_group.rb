module Mutants
  module Pages
    class EditGroup < Mutants::Pages::GroupForm
      set_url "/groups{/id}/edit"
      set_url_matcher /\/groups\/\d+\/edit/
    end
  end
end