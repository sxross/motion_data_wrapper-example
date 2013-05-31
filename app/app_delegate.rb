class AppDelegate
  include MotionDataWrapper::Delegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    Person.destroy_all
    Date.destroy_all
    jobs = Person.create last_name: 'Jobs', first_name: 'Steve'
    woz  = Person.create last_name: 'Wozniak', first_name: 'Steve'
    guy  = Person.create last_name: 'Kawasaki', first_name: 'Guy'
    jobs.dates.addObject Date.create(date: NSDate.date, title: 'Take a hike')
    jobs.dates.addObject Date.create(date: NSDate.date, title: 'See the Foo Fighters')
    woz.dates.addObject Date.create(date: NSDate.date, title: 'Code Hackery')
    woz.dates.addObject Date.create(date: NSDate.date, title: '6502 Rules Party')
    guy.dates.addObject Date.create(date: NSDate.date, title: 'Big Cocktail Party')
    puts "people"
    Person.all.each do |person|
      puts person.full_name
      person.dates.each do |date|
        puts "  #{date.date} : #{date.title}"
      end
    end
    true
  end
end
