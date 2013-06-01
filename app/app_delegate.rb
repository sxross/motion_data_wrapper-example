SEED = false

class AppDelegate
  include MotionDataWrapper::Delegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    if SEED
      Person.destroy_all
      Date.destroy_all
      jobs = Person.create last_name: 'Jobs', first_name: 'Steve'
      woz  = Person.create last_name: 'Wozniak', first_name: 'Steve'
      guy  = Person.create last_name: 'Kawasaki', first_name: 'Guy'
      jobs.dates = NSSet.setWithArray [Date.create!(date: NSDate.date, title: 'Take a hike'),
                          Date.create!(date: NSDate.date, title: 'See the Foo Fighters')]
      jobs.save!
      woz.dates = NSSet.setWithArray [Date.create!(date: NSDate.date, title: 'Code Hackery'),
                          Date.create!(date: NSDate.date, title: '6502 Rules Party')]
      woz.save!
      guy.dates = NSSet.setWithArray [Date.create!(date: NSDate.date, title: 'Big Cocktail Party')]
      guy.save!
    end

    puts "people"
    Person.all.each do |person|
      puts "#{person.full_name} has #{person.dates.count} dates"
      person.dates.each do |date|
        puts "  #{date.date} : #{date.title}"
      end
    end
    
    puts "dates"
    Date.all.each do |date|
      puts "#{date.date} : #{date.title}"
    end
    
    window.makeKeyAndVisible
    true
  end
  
  def window
    @window ||= begin
      w = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
      if Device.ipad?
         w.rootViewController = split_view_controller
      else
        @current_controller = @people_controller = PeopleViewController.alloc.init
        @navigation_controller = UINavigationController.alloc.initWithRootViewController(@people_controller)
        @navigation_controller.delegate = self
        w.rootViewController = @navigation_controller
      end
      w
    end
  end
end
