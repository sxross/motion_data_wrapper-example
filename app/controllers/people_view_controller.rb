class PeopleViewController < UITableViewController
  def viewWillAppear(animated)
    puts "appearing"
    @people = Person.all
  end
  
  def tableView(tableView, numberOfSectionsInTableView:section)
    1
  end
  
  def tableView(tableView, numberOfRowsInSection:section)
    @people.length
  end
  
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(cell_identifier)

    if not cell
      cell = UITableViewCell.alloc.initWithStyle UITableViewCellStyleDefault, reuseIdentifier:cell_identifier
    end
    
    person = @people[indexPath.row]
    cell.textLabel.text = person.full_name
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator if person.dates.count > 0
    
    cell
  end
  
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    dates_view_controller = DatesViewController.new
    dates_view_controller.dates = @people[indexPath.row].dates
    self.navigationController.pushViewController(dates_view_controller, animated: true)
  end
  
  def cell_identifier
    'people cell id'
  end
end