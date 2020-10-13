describe "student_task test" do

    it "how many courses shows how many tables" do
      user = User.find_by(name: "student2064")
      login_as(user.name)
      stub_current_user(user, user.role.name, user.role)

      visit '/student_task/list'

      numberOfTables = user.course.length
      # puts "Number Of Tables: " + numberOfTables.to_s
      expect(page).to have_css('table', count: numberOfTables*2)
    end
end
