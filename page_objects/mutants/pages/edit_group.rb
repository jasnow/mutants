module Mutants
  module Pages
    class EditGroup < Mutants::Pages::ApplicationPage
      set_url "/groups{/id}/edit"
      set_url_matcher /\/groups\/\d+\/edit/

      element :name,   '#name'
      element :update, "input[type='submit']"
    end
  end
end