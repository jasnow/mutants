Given(/^A list of tasks$/) do |table|
  data = table.raw
  return if data.empty? || data.size == 1
  i = 1
  @tasks = []
  while i < data.size
    @tasks << create(:task, name: data[i][0])
    i += 1
  end
  expect(@tasks.count).to eq(data.size - 1)
end

When(/^I visit tasks management page$/) do
  @task_management_page = Mutants::Pages::TaskManagement.new
  @task_management_page.load
end

Then(/^I see the list of tasks$/) do
  @task_management_page.wait_for_task_list_items
  expect(@task_management_page).to have_task_list_items
  task_list = @task_management_page.task_list_items

  expect(task_list).to have(@tasks.count).elements
  expect(task_list.first.name).to eq(@tasks.sort.first.name)
  expect(task_list.last.name).to eq(@tasks.sort.last.name)

  expect(task_list.first.id).to eq(@tasks.sort.first.id)
  expect(task_list.last.id).to eq(@tasks.sort.last.id)
end

When(/^I visit the create new task page$/) do
  @create_new_task_page = Mutants::Pages::NewTask.new
  @create_new_task_page.load
end

When(/^I fill in the name "(.*?)"$/) do |task_name|
  @create_new_task_page.task_name.set task_name
end

When(/^I click on the Save button$/) do
  @create_new_task_page.save.click
end

Then(/^I get a confirmation that task has been created successfully$/) do
  @edit_task_page = Mutants::Pages::EditTask.new
  expect(@edit_task_page).to be_displayed

  expect(@edit_task_page.flash).to eq("Task has been created successfully!")
end

Then(/^I get an error message$/) do
  @new_task_page = Mutants::Pages::NewTask.new
  expect(@new_task_page).to be_displayed

  expect(@new_task_page.flash).to eq("Cannot create task!")
end

When(/^I visit the page of the task "(.*?)"$/) do |task_name|
  @task = Mutants::Task.find_by_name!(task_name)
  @edit_task_page = Mutants::Pages::EditTask.new
  @edit_task_page.load(id: @task.id)
end

And(/^I change the name to "(.*?)"$/) do |task_name|
  @edit_task_page.task_name.set task_name
end

And(/^I click on Update button$/) do
  @edit_task_page.update.click
end

Then(/^I get a confirmation message that the task has been updated$/) do
  expect(@edit_task_page).to be_displayed

  expect(@edit_task_page.flash).to eq("Task has been successfully updated!")
end

And(/^I see the task having the new name "(.*?)"$/) do |task_name|
  expect(@task.reload.name).to eq(task_name)
end

And(/^I click to delete task "(.*?)"$/) do |task_name|
  @task_management_page = Mutants::Pages::TaskManagement.new
  @task = Mutants::Task.find_by_name(task_name)
  task = @task_management_page.task_list_items.select {|tli| tli.id == @task.id}.first
  task.delete.click
end

And(/^I confirm the delete action$/) do
  accept_alert
end

Then(/^the task "(.*?)" does not exist anymore$/) do |task_name|
  expect(Mutants::Task.find_by_name(task_name)).to be_nil
end

And(/^I fill in the search box with "(.*?)"$/) do |keyword|
  @task_management_page = Mutants::Pages::TaskManagement.new
  @task_management_page.search_box.set keyword
end

And(/^I click on the search button$/) do
  @task_management_page.search_button.click
end

Then(/^Task list displays all tasks that match "(.*?)"$/) do |keyword|
  @task_management_page.wait_for_task_list_items
  expect(@task_management_page).to have_task_list_items
  task_list = @task_management_page.task_list_items

  tasks_matching = Mutants::Task.where("name like ?", "%#{keyword}%").order(:name).all.map{|t| {:name => t.name, :id => t.id}}

  expect(task_list).to have(tasks_matching.count).elements
  expect(task_list.first.name).to eq(tasks_matching.first[:name])
  expect(task_list.last.name).to eq(tasks_matching.last[:name])

  expect(task_list.first.id).to eq(tasks_matching.first[:id])
  expect(task_list.last.id).to eq(tasks_matching.last[:id])
end

When(/^I click on new task link$/) do
  @task_management_page.new_task.click
end

Then(/^I am on the new task page$/) do
  new_task_page = Mutants::Pages::NewTask.new
  expect(new_task_page).to be_displayed
end